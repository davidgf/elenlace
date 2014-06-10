class WeddingUser < User
    
    validates :wedding, presence: true
    validates :password, presence: true
    validates :password, uniqueness: { scope: :wedding, message: "Should be unique"}
    validate :role_not_changed
    belongs_to :wedding
    belongs_to :table
    has_many :dances
    has_many :partners, through: :dances
    has_many :messages
    acts_as_voter
    before_create do 
        self.auth_token = SecureRandom.urlsafe_base64
    end

    def self.authenticate(wedding_id, password)
        WeddingUser.where(wedding_id: wedding_id).find_by_password(password)
    end

private
    def role_not_changed
        if role_changed? && self.persisted?
            errors.add(:role, "Changing role is not allowed")
        end
    end
end