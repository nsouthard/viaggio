class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user


    def admin_signed_in?
      current_user && current_user.admin
    end
    helper_method :admin_signed_in?

  private

    def authenticate_user!
      redirect_to '/login' unless current_user
    end

    def authenticate_admin!
      redirect_to "/" unless current_user && current_user.admin
    end

end
