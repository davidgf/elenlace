class Guest < User

    validates :wedding, presence: true
    
    belongs_to :wedding

    def is_guest?
        return true
    end
end