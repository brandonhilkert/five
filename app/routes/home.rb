class Five
  get '/home' do
    redirect '/' unless signed_in?

    @token = session[:access_token]
    @secret = session[:access_secret]

    @account = client.verify_credentials

    haml :home
  end
end