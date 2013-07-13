require "rack/test"

describe Anypow::App do
  include Rack::Test::Methods

  def app
    config = File.expand_path('../../resources/config.ru', __FILE__)
    Anypow::App.new("rackup -p $PORT -s webrick #{config}")
  end

  it "respond from the backend server" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hello Rack!")
  end
end
