class UsersController < ApplicationController
before_action :define_current_user


def create
    User.create(user_params)
    redirect_to users_path
end

def index
    @users = User.all
end

def update
    @user.update(user_params)
    redirect_to @user
end

def destroy
    @user.destroy
    redirect_to users_path
end

private

def define_current_user
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
