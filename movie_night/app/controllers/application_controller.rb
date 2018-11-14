class ApplicationController < ActionController::Base
  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "You don't have permission to access this page."
  end

  before_action :define_error_message


    def current_user
        @current_user = User.find(session[:current_user_id])

    end

    def define_error_message
        @error_message = flash[:error_message]
    end
end
