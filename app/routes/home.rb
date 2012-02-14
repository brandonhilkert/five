class Five
  get '/home' do
    redirect '/' unless signed_in?
    haml :home
  end
end