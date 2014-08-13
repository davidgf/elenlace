class User < ActiveRecord::Base
include Clearance::User

    ROLES = %w[admin]

    def is_admin?
        return false
    end

end
