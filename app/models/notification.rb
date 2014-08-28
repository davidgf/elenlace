class Notification < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :resource, polymorphic: true
  validates :attendee, :resource, :key, presence: true
end
