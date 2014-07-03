class Song < ActiveRecord::Base
    validates :title, :artist, :wedding, presence: true
    belongs_to :wedding
    acts_as_votable
end
