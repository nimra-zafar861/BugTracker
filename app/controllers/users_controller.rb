class UsersController < ApplicationController
  skip_authorization_check :only => [:create]

  def new
    @user= User.new
  end
  def index
    @user=User.all
  
  end
  def create
    @user=User.create(user_params)
    if @user.save
      
    redirect_to projects_path
    else
      render "new",status: :unprocessable_entity
    end
  end
  def show
    @users=User.find(params[:id])
    
  end

 
  public
  def user_params
    params.require(:user).permit(:name,:email,:password ,:password_confirmation ,:user_type)
  end 
  helper_method :current_user
  public
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end


end
