class Groom < User

    validates :wedding, presence: true
    
    belongs_to :wedding

    def is_groom?
        return true
    end
end