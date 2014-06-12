class Dance < ActiveRecord::Base
    belongs_to :attendee
    belongs_to :partner, class_name: Attendee

    validates :partner, :attendee, presence: true
    validates :partner_id, uniqueness: { scope: :attendee_id, message: "You can't invite the same person twice"}

end
