require "#{ENV['PDK_PATH']}/lib/ant/lib/ant.jar"
require "#{ENV['PDK_PATH']}/lib/ant/lib/ant-launcher.jar"

Java::org.apache.tools.ant.Main.main(ARGV)
