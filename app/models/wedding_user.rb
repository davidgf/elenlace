class WeddingUser < User
    validates :wedding, presence: true
    
    belongs_to :wedding
end