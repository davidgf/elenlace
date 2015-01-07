class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  validates :comment, presence: true

  default_scope -> { order('created_at ASC') }

  belongs_to :attendee
  delegate :wedding, to: :attendee
  auto_html_for :comment do
    html_escape
    youtube(:width => "100%", :height => "100%", :autoplay => false)
  end

  before_create :notify

private

  def notify
    commenters = same_post_commenters
    owner = self.commentable.attendee
    commenters.delete owner
    commenters.delete self.attendee
    notifications = []
    if owner != self.attendee
        notifications << build_notification_params(owner, :owned)
    end
    commenters.each do |attendee|
        notifications << build_notification_params(attendee, :commented)
    end
    Notification.create(notifications)
  end

  def build_notification_params(attendee, key)
    return {attendee: attendee, resource: self.commentable, key: key}
  end

  def same_post_commenters
    commenters = self.commentable.comments.map {|c| c.attendee }
    commenters.uniq!
    return commenters
  end
end
