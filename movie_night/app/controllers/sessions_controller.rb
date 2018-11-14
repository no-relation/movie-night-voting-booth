class SessionsController < ApplicationController
  before_action :define_error_message

    def create
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:current_user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error_message] = 'Wrong Username or Password'
            redirect_to login_path
        end
    end

    def define_error_message
        @error_message = flash[:error_message]
    end
end

