class Five
  get '/:screen_name' do
    @user = User.find_by_screen_name(params[:screen_name])
    redirect '/' unless @user
    @wants = @user.wants
    haml :home
  end

  post '/wants' do
    redirect '/' if !signed_in?

    current_user.push(wants: params[:want]) if current_user.wants.count < 5
    redirect "/#{current_user.screen_name}"
  end

  get '/wants/:index' do
    redirect '/' if !signed_in?

    current_user.wants.delete_at params[:index].to_i
    current_user.save
    redirect "/#{current_user.screen_name}"
  end


end