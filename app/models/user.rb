class User < ActiveRecord::Base

    validates :username, presence: true
    validate :role_not_changed
    belongs_to :table
    has_many :dances
    has_many :partners, through: :dances

    ROLES = %w[admin groom guest]

    def is_admin?
        return self.role == 'admin'
    end

    def is_guest?
        return self.role == 'guest'
    end
    
    def is_groom?
        return self.role == 'groom'
    end

private
    def role_not_changed
        if role_changed? && self.persisted?
            errors.add(:role, "Changing role is not allowed")
        end
    end
end
