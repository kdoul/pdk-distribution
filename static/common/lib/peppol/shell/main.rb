if ARGV.size > 0 then
    path = "#{__dir__}/command/#{ARGV[0]}.rb"
    ARGV.shift
    
    load path
else
    puts "Usage: pdk [command]"
end

