require 'fileutils'
require 'pathname'

ROOT=ARGV[0]
FOLDER=File.join(ROOT, ARGV[1])
BITS=ARGV[2]

# Basics
NAME="Peppol Development Kit (PDK)"
MANUFACTURER="OpenPEPPOL AISBL"

NAME_DIR="PDK"
MANUFACTURER_DIR="Peppol"

# GUIDs
ID_UPGRADE_64="1FC690D3-4526-4A54-A989-763F64B1E2F7"
ID_UPGRADE_32="7872F398-1746-4DD0-8F01-831B718B6F63"

if BITS == "64"
    ID_UPGRADE=ID_UPGRADE_64
else
    ID_UPGRADE=ID_UPGRADE_32
end

# Version
FULL_VERSION=File.read "#{FOLDER}/lib/peppol/version"
if FULL_VERSION.split('/')[0] == 'snapshot'
    VERSION="0.0.0"
elsif FULL_VERSION.split('/')[0] == 'master'
    VERSION="0.0.0"
else
    VERSION=FULL_VERSION.split('/')[0]
end

# Helpers
def idfy(name)
    res = name.to_s[FOLDER.size+1..-1].gsub('-', '...').gsub('/', '__').gsub(' ', '')
    res.size > 70 ? res[res.size-70..-1] : res
end

def folder(path, indent)
    Pathname.new(path).children.select { |c| c.directory? }.sort.each do |d|
        puts "#{indent}<Directory Id=\"d_#{idfy d}\" Name=\"#{d.basename}\">"

        Pathname.new(d).children.select { |c| c.file? }.sort.each do |f|
            source=f.to_s[ROOT.size+1..-1]

            if source.size > 110
                source = "tl/#{idfy f}"
                FileUtils.mkdir_p "#{ROOT}/tl"
                #puts "#{f} => #{ROOT}/#{source}"
                FileUtils.cp f, "#{ROOT}/#{source}"
            end

            puts "#{indent}\t<Component Id=\"c_#{idfy f}\" Guid=\"*\">"
            puts "#{indent}\t\t<File Id=\"f_#{idfy f}\" Source=\"#{source}\" Name=\"#{f.basename}\" KeyPath=\"yes\" Vital=\"yes\"/>"
            puts "#{indent}\t</Component>"
        end

        folder d, "#{indent}\t"

        puts "#{indent}</Directory>"
    end
end

def components(path)
    Pathname.new(path).children.select { |c| c.directory? }.sort.each do |d|
        Pathname.new(d.to_s).children.select { |c| c.file? }.sort.each do |f|
            puts "\t\t\t<ComponentRef Id=\"c_#{idfy f}\"/>"
        end

        components d
    end
end

# Wix
puts "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
puts "<Wix xmlns=\"http://schemas.microsoft.com/wix/2006/wi\">"

# Product
puts "\t<Product Name=\"#{NAME} #{BITS}-bit\" Manufacturer=\"#{MANUFACTURER}\" Id=\"*\" UpgradeCode=\"#{ID_UPGRADE}\" Language=\"1033\" Codepage=\"1252\" Version=\"#{VERSION}\">"

# Package
if BITS == "64"
    puts "\t\t<Package Id=\"*\" Keywords=\"Installer\" Description=\"#{NAME} Installer\" Manufacturer=\"#{MANUFACTURER}\" Comments=\"#{FULL_VERSION}\" InstallerVersion=\"200\" Languages=\"1033\" Compressed=\"yes\" SummaryCodepage=\"1252\" Platform=\"x64\"/>"
else
    puts "\t\t<Package Id=\"*\" Keywords=\"Installer\" Description=\"#{NAME} Installer\" Manufacturer=\"#{MANUFACTURER}\" Comments=\"#{FULL_VERSION}\" InstallerVersion=\"200\" Languages=\"1033\" Compressed=\"yes\" SummaryCodepage=\"1252\"/>"
end

puts "\t\t<Media Id=\"1\" Cabinet=\"#{NAME_DIR}.cab\" EmbedCab=\"yes\" DiskPrompt=\"CD-ROM #1\" />"
puts "\t\t<Property Id=\"DiskPrompt\" Value=\"#{NAME} Installation [1]\" />"

puts "\t\t<Directory Id=\"TARGETDIR\" Name=\"SourceDir\">"

if BITS == "64"
    puts "\t\t\t<Directory Id=\"ProgramFiles64Folder\" Name=\"PFFolder\">"
else
    puts "\t\t\t<Directory Id=\"ProgramFilesFolder\" Name=\"PFFolder\">"
end

puts "\t\t\t\t<Directory Id=\"#{MANUFACTURER_DIR}\" Name=\"#{MANUFACTURER_DIR}\">"
puts "\t\t\t\t\t<Directory Id=\"INSTALLDIR\" Name=\"#{NAME_DIR}\">"

puts "\t\t\t\t\t\t<Component Id=\"PathComponent\" Guid=\"2A46D0F6-5396-470D-8A90-3470A87C9B93\" KeyPath=\"yes\">"
puts "\t\t\t\t\t\t\t<CreateFolder />"
puts "\t\t\t\t\t\t\t<Environment Id=\"PDK_PATH\" Name=\"PDK_PATH\" Value=\"[INSTALLDIR]\" Permanent=\"no\" Action=\"set\" System=\"yes\" />"
puts "\t\t\t\t\t\t\t<Environment Id=\"PATH\" Name=\"PATH\" Value=\"%PDK_PATH%\\\\bin\" Permanent=\"no\" Part=\"last\" Action=\"set\" System=\"yes\" />"
puts "\t\t\t\t\t\t</Component>"

folder FOLDER, "\t\t\t\t\t\t"

puts "\t\t\t\t\t</Directory>"
puts "\t\t\t\t</Directory>"
puts "\t\t\t</Directory>"
puts "\t\t</Directory>"

puts "\t\t<Feature Id=\"MainProduct\" Title=\"Main Product\" Level=\"1\">"

components FOLDER

puts "\t\t\t<ComponentRef Id=\"PathComponent\"/>"
puts "\t\t</Feature>"

#echo "\t\t<UIRef Id=\"WixUI_Minimal\"/>"

# /Product
puts "\t</Product>"

# /Wix
puts "</Wix>"