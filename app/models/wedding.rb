class Wedding < ActiveRecord::Base
    include FriendlyId
    friendly_id :wedding_title, use: :slugged

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

    validates :groom_name, :bride_name, presence: true

    def wedding_title
        if self.groom and self.bride
            return "#{self.groom.username} y #{self.bride.username}"
        else
            return self.id
        end
    end

    def should_generate_new_friendly_id?
        if self.groom and self.bride
            self.groom.username_changed? or self.bride.username_changed?
        end
    end
end
