class UsersController < ApplicationController

  def new
    @user= User.new
  end
  def create
    @user=User.create(user_params)
    if @user.save
      
    redirect_to users_path
    else 
      render "new",status: :unprocessable_entity
    end
  end
  helper_method :current_user
  private 
  def user_params
    params.require(:user).permit(:name,:email,:password ,:password_confirmation)
  end 
  
  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end


end
