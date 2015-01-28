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
    has_many :events, dependent: :destroy
    has_attached_file :cover_image, :styles => { :big => "1200x1200>" }, :convert_options => { :all => '-auto-orient' }, :default_url => "/images/default_cover.jpg"
    validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

    validates :groom_name, :bride_name, :groom_surname, :bride_surname, presence: true

    def slug_candidates
        [
            "#{self.groom_name} y #{self.bride_name}",
            "#{self.groom_name} #{self.groom_surname} y #{self.bride_name} #{self.bride_surname}",
            "#{self.groom_name} #{self.groom_surname} y #{self.bride_name}",
            "#{self.groom_name} y #{self.bride_name} #{self.bride_surname}"
        ]
    end

    def wedding_title
        return "#{self.groom_name} &<br /> #{self.bride_name}"
    end
end
