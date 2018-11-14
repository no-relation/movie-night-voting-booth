class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
     role :admin, {is_admin: true} do
       can :manage, User
       can :destroy, Movie
     end

     role :user do 
       can :create, Movie 
       can :create, Vote 
       can :read, Movie
       can :read, Vote
       can :destroy, Vote do |vote, user|
         vote.user_id == user.id 
       end 
     end
<<<<<<< HEAD
=======
     
    #  The base role with no additional conditions.
    #  Applies to every user.
     
    #  role :guest do
    #   can :read, Session
    #   can :read, User
    #   can :read, Movie
    #  end
>>>>>>> dd19049d533f35876b7bf7eebdf86e2d933122a4


    # More privileged role, applies to registered users.
    #
    # role :member, proc { |user| user.registered? } do
    #   can :create, Post
    #   can :create, Comment
    #   can [:update, :destroy], Post do |post, user|
    #     post.author == user
    #   end
    # end

  end
end
