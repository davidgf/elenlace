class Event < ActiveRecord::Base
    validates :wedding, presence: true

	belongs_to :wedding
    has_one :location
end
