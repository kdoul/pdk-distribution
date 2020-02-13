require 'rubygems'
require "irb"
require 'irb/completion'

def IRB.custom_start custom_conf = {}
  STDOUT.sync = true

  IRB.setup(nil)

  custom_conf.each do |k,v|
    IRB.conf[k] = v
  end

  IRB.conf[:PROMPT_MODE] = :SIMPLE

  if @CONF[:SCRIPT]
    irb = IRB::Irb.new(nil, @CONF[:SCRIPT])
  else
    irb = IRB::Irb.new
  end

  @CONF[:IRB_RC].call(irb.context) if @CONF[:IRB_RC]
  @CONF[:MAIN_CONTEXT] = irb.context

  trap("SIGINT") do
    irb.signal_handle
  end

  begin
    catch(:IRB_EXIT) do
      irb.eval_input
    end
  ensure
    irb_at_exit
  end
end

IRB.custom_start
