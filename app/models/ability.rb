class Ability
  include CanCan::Ability

  def initialize(user)
    unless user
      can :read, :all
    else
      can [:create, :destroy], [Comment, Like]
      can :update, Comment
      can :read, :all
    if user.admin?
      can :manage, :all
    end
    end
  end
end
