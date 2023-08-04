class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, Post
      can :create, Post
      can :create, Comment
      can :update, Post, author_id: user.id
      can :update, Comment, user_id: user.id
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, user_id: user.id
      can :index, Post
    end
  end
end
