class Message < ActiveRecord::Base
    belongs_to :wedding_user
    validates :wedding_user, presence: true
    acts_as_votable
end
