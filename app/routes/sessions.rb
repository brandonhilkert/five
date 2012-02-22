class Five
  get '/login' do
    request_token = oauth_consumer.get_request_token(oauth_callback: "#{base_url}/callback")
    session[:request_token] = request_token.token
    session[:request_secret] = request_token.secret
    redirect request_token.authorize_url
  end

  get '/callback' do
    request_token = OAuth::RequestToken.new(oauth_consumer, session[:request_token], session[:request_secret])
    access_token = request_token.get_access_token({}, oauth_token: params[:oauth_token], oauth_verifier: params[:oauth_verifier])
    session[:access_token] = access_token.token
    session[:access_secret] = access_token.secret
    redirect "/process"
  end

  get '/process' do
    user = User.process_login(client.verify_credentials)
    sign_in(user)
    redirect '/#{user.screen_name}'
  end


  get '/logout' do
    sign_out
    redirect '/'
  end
end