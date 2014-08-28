class Message < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    delegate :wedding, to: :attendee
    validates :attendee, presence: true
    acts_as_votable
    acts_as_commentable
    self.per_page = 15
    auto_html_for :message do
        youtube(:width => "100%", :height => "100%", :autoplay => false)
        html_escape
    end

end
