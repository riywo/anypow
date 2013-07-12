$:.unshift File.expand_path("../lib", __FILE__)
require "anypow"

run Anypow::App.new("python -m SimpleHTTPServer $PORT")
