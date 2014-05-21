class Dance < ActiveRecord::Base
    belongs_to :user
    belongs_to :partner, class_name: User

    validates :partner, :user, presence: true
    validates :partner_id, uniqueness: { scope: :user_id, message: "You can't invite the same person twice"}

end
