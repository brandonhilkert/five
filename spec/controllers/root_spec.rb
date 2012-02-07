require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Five do
  it "should load successfully" do
    get '/'
    last_response.status.should == 200
  end
end