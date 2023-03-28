class BugsController < ApplicationController
     
  def index
    @bugs=Bug.all
  end
  def new
  @bugs=Bug.new
      end
    def create
        
        @bugs = Bug.create(bug_params)
        if @bugs.save
          redirect_to bugs_path
        else 
          render "new"
        end
      end
   def show
    @bugs = Bug.find(params[:id])

   end
        def bug_params
          params.require(:bug).permit(:title, :b_type ,:status)
        end
  
        def edit
            @bugs = Bug.find(params[:id])
          end
        
          def update
       
          end
end
