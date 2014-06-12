require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "should not save without user" do
    message = FactoryGirl.build(:message, attendee: nil)
    assert_not message.save, "Saved without user"
  end

end
