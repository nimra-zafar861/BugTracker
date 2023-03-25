class BugsController < ApplicationController

     def create
    @projects = Project.find(params[:project_id])
    @bug = @projects.bugs.create(bug_params)
    redirect_to project_path(@projects)
  end

  private
    def bug_params
      params.require(:bug).permit(:title, :bug_type,:st)
    end
end
