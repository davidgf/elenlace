class User < ActiveRecord::Base

    validates :username, presence: true
    validate :role_not_changed
    belongs_to :table
    has_many :dances
    has_many :partners, through: :dances
    has_many :messages
    acts_as_voter

    ROLES = %w[admin groom bride guest]

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

private
    def role_not_changed
        if role_changed? && self.persisted?
            errors.add(:role, "Changing role is not allowed")
        end
    end
end
