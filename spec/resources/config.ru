require 'rack'
run Proc.new {|env| [200, {"Content-Type" => "text/plain", "Content-Length" => "11"}, ["Hello Rack!"]]}
