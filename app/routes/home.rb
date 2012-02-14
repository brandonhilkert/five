class Five
  get '/home' do
    redirect '/' unless signed_in?

    @account = client.verify_credentials

    haml :home
  end
end