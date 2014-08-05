class Attendee < ActiveRecord::Base

    validates :username, :wedding, :password, presence: true
    validates :password, uniqueness: { scope: :wedding, message: "Should be unique"}
    validate :role_not_changed
    belongs_to :wedding
    belongs_to :table
    has_many :dances, dependent: :destroy
    has_many :partners, through: :dances
    has_many :messages, dependent: :destroy
    has_many :pictures, dependent: :destroy
    has_many :songs, dependent: :destroy
    has_attached_file :avatar, :styles => { :big => "1200x1200>",:medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    acts_as_voter
    before_create do 
        self.auth_token = SecureRandom.urlsafe_base64
    end
    before_save :encode_emoji

    def is_admin?
        return false
    end

    def is_guest?
        return false
    end
    
    def is_groom?
        return false
    end
    
    def is_bride?
        return false
    end

    def self.authenticate(wedding_id, password)
        self.where(wedding_id: wedding_id).find_by_password(password)
    end

private
    def role_not_changed
        if role_changed? && self.persisted?
            errors.add(:role, "Changing role is not allowed")
        end
    end


    def encode_emoji
        self.description = Rumoji.encode(self.description)
    end
end