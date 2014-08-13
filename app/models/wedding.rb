class Wedding < ActiveRecord::Base
    has_one :groom, inverse_of: :wedding, dependent: :destroy
    accepts_nested_attributes_for :groom
    has_one :bride, inverse_of: :wedding, dependent: :destroy
    accepts_nested_attributes_for :bride
    has_many :guests, dependent: :destroy
    has_many :attendees
    has_many :messages, through: :attendees
    has_many :pictures, through: :attendees
    has_many :dances, through: :attendees
    has_many :tables, dependent: :destroy
    has_many :songs, dependent: :destroy
end
