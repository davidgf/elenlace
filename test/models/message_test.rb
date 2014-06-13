require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "should not save without user" do
    message = FactoryGirl.build(:message, attendee: nil)
    assert_not message.save, "Saved without user"
  end

  test "should allow just one upvote per user" do
    message = FactoryGirl.create(:message)
    attendee = FactoryGirl.create(:attendee)
    message.upvote_by attendee
    assert_no_difference("message.votes_for.up.size") do
        message.upvote_by attendee
    end
  end

  test "should allow just one downvote per user" do
    message = FactoryGirl.create(:message)
    attendee = FactoryGirl.create(:attendee)
    message.downvote_by attendee
    assert_no_difference("message.votes_for.down.size") do
        message.downvote_by attendee
    end
  end

end
