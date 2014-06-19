class Table < ActiveRecord::Base
    has_many :attendees
    belongs_to :wedding
    validates :wedding, presence: true
end
