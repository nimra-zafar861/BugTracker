class BugsController < ApplicationController
    def new
    # @bug=Project.bugs.new
    end
     def create
    @projects= Project.find(params[:project_id])
    @bug = @projects.bugs.new(bug_params)
    redirect_to project_path(@projects)
  end

  private
    def bug_params
      params.require(:bug).permit(:title, :b_type)
    end
end
