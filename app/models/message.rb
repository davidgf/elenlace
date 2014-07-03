class Message < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    validates :attendee, presence: true
    acts_as_votable

    self.per_page = 15
end
