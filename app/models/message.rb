class Message < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    validates :attendee, presence: true
    acts_as_votable
    acts_as_commentable
    before_save :encode_emoji
    self.per_page = 15

private

def encode_emoji
    self.message = Rumoji.encode(self.message)
end

end
