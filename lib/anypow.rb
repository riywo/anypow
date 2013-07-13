require "anypow/version"
require "anypow/app"

module Anypow
  def self.ruby_18?
    defined?(RUBY_VERSION) and RUBY_VERSION =~ /^1\.8\.\d+/
  end
end
