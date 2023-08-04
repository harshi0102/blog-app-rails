class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    else
      can :read, Post
      can :create, [Post, Comment]
      can :update, Post, author_id: user.id
      can :update, Comment, user_id: user.id
      can :destroy, [Post, Comment], author_id: user.id
      can :index, Post
    end
  end
end
