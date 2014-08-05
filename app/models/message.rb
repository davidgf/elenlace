class Message < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    validates :attendee, presence: true
    acts_as_votable
    acts_as_commentable
    self.per_page = 15

end
