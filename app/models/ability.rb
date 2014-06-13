class Ability
    include CanCan::Ability

    def initialize(user)
        can [:upvote, :downvote], [Message, Picture]
        if user.is_groom? or user.is_bride?
            can :manage, :all
        end
        if user.is_guest?
            can [:read, :create], [Message, Picture, Dance]
            can :read, Guest
            can :update, Guest do |guest|
                guest == user
            end
            can [:update, :destroy], [Message, Picture, Dance] do |message|
                message.try(:attendee) == user
            end
        end
    end
end