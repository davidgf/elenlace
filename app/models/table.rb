class Table < ActiveRecord::Base
    has_many :attendees
    belongs_to :wedding
end
