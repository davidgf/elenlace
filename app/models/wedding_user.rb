class WeddingUser < User
    
    validates :wedding, presence: true
    belongs_to :wedding
    validate :role_not_changed
    belongs_to :table
    has_many :dances
    has_many :partners, through: :dances
    has_many :messages
    acts_as_voter
end