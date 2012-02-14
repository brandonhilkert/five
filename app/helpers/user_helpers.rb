class Five
  module UserHelpers
    def signed_in?
      !!current_user
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def sign_in(user)
      session[:user_id] = user.id
    end
  end

  helpers UserHelpers
end