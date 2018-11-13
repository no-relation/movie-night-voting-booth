class SessionsController < ApplicationController

  def new 
  end

  def create 
    @user = User.find_by(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      redirect_to new_session_path
    end
  end


end