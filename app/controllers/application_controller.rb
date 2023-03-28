class ApplicationController < ActionController::Base

#     def current_ability
#   @current_ability ||= Ability.new(current_user)
# end 
# include Authentication 
helper :all
rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  # redirect_to projects_url
end

helper_method :current_user
public
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
