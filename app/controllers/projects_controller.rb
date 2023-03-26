class ProjectsController < ApplicationController
    def index
      if params[:q].present?
      @projects=Project.where("name = ?",params[:q])
      else
         @projects = Project.all
      end

    # @projects.project_users.new
  end

  def show
    @projects = Project.find(params[:id])
   
  end

  def new
    @projects = Project.new

    @projects.project_users.new
    # @project=Project.new
    @projects.bugs.new
    end

  def create
  
    @projects = Project.create(project_params)
    
    if @projects.save
      redirect_to projects_path
    else
      render action: "new"
    end
  end

  def edit
    @projects= Project.find(params[:id])
  end

  def update
    @projects = Project.find(params[:id])

    if @projects.update(project_params)
      redirect_to projects_path
    else
      render action: "edit"
    end
  end

  def destroy 
    @projects = Project.find(params[:id])
    @user = @projects.users.find(params[:user_id])

    if @user
       @projects.users.destroy(@user)
       redirect_to project_path
    end  
  end

  protected
  def project_params
    params.require(:project).permit(:name,:description,:project_users_attributes => [:project_id ,:user_id])
  end
end
