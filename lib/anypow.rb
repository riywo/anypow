require "anypow/version"
require "anypow/app"

module Anypow
  def self.ruby_18?
    defined?(RUBY_VERSION) and RUBY_VERSION =~ /^1\.8\.\d+/
  end

  def run(app)
    if is_pow?
      super(app) if app.class == Anypow::App
    else
      super(app) if app.class != Anypow::App
    end
  end

  def run_pow(command)
    require 'rack'
    use Rack::Chunked
    use Rack::ContentLength
    run Anypow::App.new(command) if is_pow?
  end

  def is_pow?
    self.class.to_s == "Nack::Builder"
  end
end
