require "rack/test"

describe Anypow do
  include Rack::Test::Methods
  describe "VERSION" do
    subject { Anypow::VERSION }
    it { should be_a String }
  end

  describe "extend config.ru" do
    def app
      config = File.expand_path("../resources/anypow.ru", __FILE__)
      app, options = Nack::Builder.parse_file(config)
      app
    end

    it "respond from the normal rack app" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq("Hello Rack!")
    end
  end
end
