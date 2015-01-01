class Ability
    include CanCan::Ability

    def initialize(user)
        can [:upvote, :downvote], [Message, Picture, Song]
        if user.is_groom? or user.is_bride?
            can :manage, :all do |resource|
                resource.wedding == user.wedding
            end
        end
        if user.is_guest?
            can :create, [Message, Picture, Dance, Comment, Song]
            can :read, [Attendee, Song, Table, Message, Picture, Dance, Comment, Event] do |resource|
                resource.wedding == user.wedding
            end
            can :update, Attendee do |guest|
                guest == user
            end
            can [:update, :destroy], [Message, Picture, Dance, Comment] do |message|
                message.try(:attendee) == user
            end
        end
    end
end