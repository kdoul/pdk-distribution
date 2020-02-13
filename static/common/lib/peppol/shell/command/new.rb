if ARGV.size > 0 then
    path = "#{__dir__}/../template/#{ARGV[0]}.rb"
    ARGV.shift

    if File::exists?(path) then
        load path
    else
        puts "Unknown template."
    end
else
    puts "Usage: pdk new [template]"
    puts

    puts "Available templates:"
    for dir in Dir["#{__dir__}/../template/*.rb"]
        puts " * #{dir.sub(__dir__ + '/../template/', '')[0..-4]}"
    end
end