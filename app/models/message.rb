class Message < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    delegate :wedding, to: :attendee
    validates :attendee, presence: true
    acts_as_votable
    acts_as_commentable
    self.per_page = 15
    auto_html_for :message do
        html_escape
        youtube(:width => "100%", :height => "100%", :autoplay => false)
    end
    has_many :notifications, as: :resource, dependent: :destroy

end
