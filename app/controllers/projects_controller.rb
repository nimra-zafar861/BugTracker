class ProjectsController < ApplicationController
    load_and_authorize_resource
  
    def index
      
      if params[:q].present?
      @projects=Project.where("name = ?",params[:q])
      else
         @projects = Project.all
      end
    #  @projects= @projects.project_users

      authorize! :read, @projects
     

  end

  def show
    @projects = Project.find(params[:id])
   
  end

  def new
    @projects = Project.new

    @projects.project_users.new
    
    # @project=Project.new
    authorize!  :create ,@projects
   
    end

  def create
  
    @projects = Project.create(project_params)
    
    if @projects.save
      redirect_to projects_path
    else
      render action: "new" ,status: :unprocessable_entity
    end
  end

  def edit
    @projects= Project.find(params[:id])
    unauthorize! if cannot? :update ,@projects
  end

  def update
    @projects = Project.find(params[:id])

    if @projects.update(project_params)
      redirect_to projects_path
    else
      render action: "edit",status: :unprocessable_entity
    end

  end

  def destroy 
    @projects = Project.find(params[:id]) 
   
   @user = @projects.users

    if @user
       @projects.users.destroy(@user)
       @projects.destroy
       redirect_to project_path
    end  
    unauthorize! if cannot? :destroy ,@user

  end
  def destroy_user 
    @projects = Project.find(params[:id]) 
   
    @user = @projects.users
    @projects.users.destroy(@user)
  end

  protected
  def project_params
    params.require(:project).permit(:name,:description,:Bugable,:project_users_attributes => [:project_id ,:user_id])
  end
end
