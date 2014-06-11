class Dance < ActiveRecord::Base
    belongs_to :wedding_user
    belongs_to :partner, class_name: WeddingUser

    validates :partner, :wedding_user, presence: true
    validates :partner_id, uniqueness: { scope: :wedding_user_id, message: "You can't invite the same person twice"}

end
