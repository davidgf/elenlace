require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should "not be saved without attendee" do
  	notification = FactoryGirl.build(:notification, attendee: nil)
  	assert_not notification.save, "Notification saved without attendee"
  end

  should "not be saved without referenced resource" do
  	notification = FactoryGirl.build(:notification, resource: nil)
  	assert_not notification.save, "Notification saved without referenced resource"
  end

  should "not be saved without key" do
  	notification = FactoryGirl.build(:notification, key: nil)
  	assert_not notification.save, "Notification saved without key"
  end
end
