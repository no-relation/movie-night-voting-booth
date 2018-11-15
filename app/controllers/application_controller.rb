class ApplicationController < ActionController::Base
  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "You don't have permission to access this page."
  end
  before_action :current_user
  before_action :define_error_message

    def current_user
      if session[:current_user_id]
        @current_user = User.find(session[:current_user_id])
      else 
        @current_user = User.new
      end
    end

    def define_error_message
        @error_message = flash[:error_message]
    end

    def logged_in?
      if !session[:current_user_id] 
        redirect_to "/login"
      end
    end
end
