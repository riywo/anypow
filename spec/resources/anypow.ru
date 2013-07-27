$:.unshift File.expand_path("../../../lib", __FILE__)
require "anypow"
extend Anypow
config = File.expand_path(__FILE__)
run_pow "rackup -p $PORT -s webrick #{config}"

run Proc.new {|env| [200, {"Content-Type" => "text/plain", "Content-Length" => "11"}, ["Hello Rack!"]]}
