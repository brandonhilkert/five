class Five
  get '/login' do
    request_token = oauth_consumer.request_token(oauth_callback: "http://127.0.0.1:3000/callback")
    session["request_token"] = request_token.token
    session["request_secret"] = request_token.secret

    debugger

    redirect request_token.authorize_url
  end

  get '/callback' do
    access_token = oauth_consumer.authorize(session["request_token"], session["request_secret"], oauth_verifier: params[:oauth_verifier])

    # reset_session
    session["access_token"] = access_token.token
    session["access_secret"] = access_token.secret
    user = client.verify_credentials
    sign_in(user)
    redirect_back_or root_path
  end
end