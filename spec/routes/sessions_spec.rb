require_relative File.join('..', 'spec_helper')

describe Five do
  include Five::UserHelpers

  describe "GET /session/login" do
    it "should redirect" do
      get '/session/login'
      last_response.should be_redirect
    end
  end

  describe "GET /session/callback" do
    let(:access_token) { mock('AccessToken', token: "token", secret: "secret") }
      
    before(:each) do
      OAuth::RequestToken.any_instance.stub(get_access_token: access_token )
    end

    # it "should set session[:access_token]" do
    #   get '/callback'
    #   puts "rack.session".inspect
    #   session[:access_token].should == "token"
    # end

    # it "should set session[:access_secret]" do
    #   get '/callback'
    #   "rack.session"[:session][:access_token].should == "secret"
    # end

    it "should redirect" do
      get '/session/callback'
      last_response.should be_redirect
    end
  end

  describe "GET /session/process" do
    let (:user) { }

    before(:each) do
      User.stub(:process_login).and_return(user)

    end

    # it "should sign the user in" do
    #   get '/process'
    #   signed_in?.should be_true
    # end

    # it "should redirect to user's page" do
    #   get '/process'
    #   last_response.location.should == 'http://example.org/brandonhilkert'
    # end
  end

  describe "GET /session/logout" do
    # it "should set user session to nil" do
    #   get '/logout'
    #   signed_in?.should be_false
    # end

    it "should redirect" do
      get '/session/logout'
      last_response.location.should == 'http://example.org/'
    end
  end

end