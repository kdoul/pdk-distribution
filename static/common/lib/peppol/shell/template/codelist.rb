require 'erb'
require 'highline'

cli = HighLine.new
result = {}
result[:title] = cli.ask "Code list title? "
result[:identifier] = cli.ask("Code list identifier? ") { |q| 
    q.default = "codelist"
    q.validate = /[A-Za-z0-9]+/
}
result[:version] = cli.ask "Code list version? "
result[:agency] = cli.ask "Issuing agency? "
result[:filename] = cli.ask("Filename? ")  { |q|
    q.default = (ARGV[0] != nil) ? ARGV[0] : "#{result[:identifier]}.xml"
}

renderer = ERB.new(File.read("#{__dir__}/codelist.xml.erb"))
File.write(result[:filename], renderer.result_with_hash(result))