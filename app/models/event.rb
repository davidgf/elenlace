class Event < ActiveRecord::Base
    validates :wedding, :name, :description, :location, :datetime, presence: true
	belongs_to :wedding
    has_one :location
	accepts_nested_attributes_for :location
end
