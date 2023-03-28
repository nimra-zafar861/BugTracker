class UsersController < ApplicationController
  load_and_authorize_resource

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
 


end
