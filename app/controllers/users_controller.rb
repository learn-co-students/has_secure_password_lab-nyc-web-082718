class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
      redirect_to '/home'
    end
  end

  def home
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
