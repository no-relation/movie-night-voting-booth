class UsersController < ApplicationController
before_action :instance_user


def create
    @user = User.create(user_params)
    if @user.valid?
        @user.save
        redirect_to login_path
    else
        flash[:error] = "That name has already been taken"
        redirect_to new_user_path
    end        
end

def index
    @users = User.all
end

def update
    @user.update(user_params)
    redirect_to @user
end

def destroy
    if @user == current_user
        @user.destroy
        session.clear
        redirect_to users_path
    else
        flash[:error_message] = "You are not authorized to destroy #{@user.name}"
        redirect_to @user
    end
end

private

def instance_user
    if params[:id]
        @user = User.find(params[:id])
    else
        @user = User.new
    end
end

def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :role)
end    

end
