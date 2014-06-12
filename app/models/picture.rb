class Picture < ActiveRecord::Base
    belongs_to :attendee
    validates :attendee, presence: true
    acts_as_votable
    
end
