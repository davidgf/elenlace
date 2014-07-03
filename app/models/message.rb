class Message < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    validates :attendee, presence: true
    acts_as_votable
end
