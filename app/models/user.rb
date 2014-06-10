class User < ActiveRecord::Base

    validates :username, presence: true

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

end
