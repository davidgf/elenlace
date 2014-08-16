class Wedding < ActiveRecord::Base
    include FriendlyId
    friendly_id :slug_candidates, use: :slugged

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

    def slug_candidates
        [
            "#{self.groom_name} y #{self.bride_name}",
            "#{self.groom_name} #{self.groom_surname} y #{self.bride_name} #{self.bride_surname}",
            "#{self.groom_name} #{self.groom_surname} y #{self.bride_name}",
            "#{self.groom_name} y #{self.bride_name} #{self.bride_surname}"
        ]
    end

end
