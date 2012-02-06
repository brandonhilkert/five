require File.dirname(__FILE__) + '/spec_helper'

describe Five do
  include Rack::Test::Methods

  def app
    Five
  end

  it "should load successfully" do
    get '/'
    last_response.status.should == 200
  end
end