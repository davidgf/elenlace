class Ability
    include CanCan::Ability

    def initialize(user)
        can [:upvote, :downvote], [Message, Picture, Song]
        if user.is_groom? or user.is_bride?
            can :manage, :all
        end
        if user.is_guest?
            can [:read, :create], [Message, Picture, Dance, Comment]
            can :read, [Attendee, Song]
            can :create, Song
            can :update, Attendee do |guest|
                guest == user
            end
            can [:update, :destroy], [Message, Picture, Dance] do |message|
                message.try(:attendee) == user
            end
        end
    end
end