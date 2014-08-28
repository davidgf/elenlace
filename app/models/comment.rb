class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  validates :comment, presence: true

  default_scope -> { order('created_at ASC') }

  belongs_to :attendee
  auto_html_for :comment do
    youtube(:width => "100%", :height => "100%", :autoplay => false)
  end
end
