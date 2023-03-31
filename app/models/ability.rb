class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
  if user.user_type == "Manager"
    can :manage, :all
  elsif user.user_type == "Developer"
    can :read, :all
    # byebug
    # can :read, Project: {id: user.id}
  elsif user.user_type == "QA"
    can :read ,:all
  end
  end
end
