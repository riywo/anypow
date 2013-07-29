$:.unshift File.expand_path("../lib", __FILE__)
require "anypow"
extend Anypow
run_pow "foreman start -p $PORT"

run Proc.new {|env| [200, {"Content-Type" => "text/plain"}, ["Hello Rack!"]]}
