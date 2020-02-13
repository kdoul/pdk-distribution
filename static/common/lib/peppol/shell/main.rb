if ARGV.size > 0 then
    path = "#{__dir__}/command/#{ARGV[0]}.rb"
    ARGV.shift

    if File::exists?(path) then
        load path
    else
        puts "Unknown command."
    end
else
    puts "Usage: pdk [command]"
    puts

    puts "Available commands:"
    for dir in Dir["#{__dir__}/command/*.rb"]
        puts " * #{dir.sub(__dir__ + '/command/', '')[0..-4]}"
    end
end

