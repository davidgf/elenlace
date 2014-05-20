class User < ActiveRecord::Base
    belongs_to :table

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
end
