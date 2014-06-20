class Wedding < ActiveRecord::Base
    has_one :groom, dependent: :destroy
    has_one :bride, dependent: :destroy
    has_many :guests, dependent: :destroy
    has_many :attendees
    has_many :messages, through: :attendees
    has_many :pictures, through: :attendees
    has_many :dances, through: :attendees
    has_many :tables
end
