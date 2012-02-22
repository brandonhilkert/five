class Five
  get '/:screen_name' do
    @user = User.find_by_screen_name(params[:screen_name])
    redirect '/' unless @user
    @wants = @user.wants
    haml :home
  end
end