class Five
  get '/:screen_name' do
    @user = User.find_by_screen_name(params[:screen_name])
    redirect '/' unless @user
    @wants = @user.wants
    haml :home
  end

  post '/wants' do
    redirect '/' if !signed_in?

    @user = current_user
    @user.push(wants: params[:want]) if @user.wants.count < 5
    redirect "/#{@user.screen_name}"
  end
end