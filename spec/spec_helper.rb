require "rspec"
require "anypow"
require "rack"

module Nack
  class Builder < Rack::Builder
    def self.new_from_string(builder_script, file="(rackup)")
      eval "Nack::Builder.new {\n" + builder_script + "\n}.to_app",
        TOPLEVEL_BINDING, file, 0
    end
  end
end
