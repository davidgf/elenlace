class Bride < User

    validates :wedding, presence: true
    
    belongs_to :wedding

    def is_bride?
        return true
    end
end