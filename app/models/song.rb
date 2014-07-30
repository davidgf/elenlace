class Song < ActiveRecord::Base
    validates :title, :artist, :wedding, :attendee, presence: true
    belongs_to :wedding
    belongs_to :attendee
    acts_as_votable
end
