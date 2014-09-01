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

  should "be deleted on attendee removal" do
  	notification = FactoryGirl.create(:notification)
  	assert_difference('Notification.count', -1) do 
  		notification.attendee.destroy
  	end
  end

  should "be deleted on picture removal" do
  	notification = FactoryGirl.create(:notification_picture)
  	assert_difference('Notification.count', -1) do 
  		notification.resource.destroy
  	end
  end

  should "be deleted on message removal" do
  	notification = FactoryGirl.create(:notification_message)
  	assert_difference('Notification.count', -1) do 
  		notification.resource.destroy
  	end
  end

  should "be created on comment creation" do
  	assert_difference('Notification.count', 1) do
  		comment = FactoryGirl.create(:comment)
  	end
  end

  should "notify same post commenters" do
    michael = FactoryGirl.create(:guest)
    message = FactoryGirl.create(:message, attendee: michael)
    bob = FactoryGirl.create(:guest, wedding: michael.wedding)
    susan = FactoryGirl.create(:guest, wedding: michael.wedding)
    mary = FactoryGirl.create(:guest, wedding: michael.wedding)
    FactoryGirl.create(:comment, attendee: bob, commentable: message)
    message.reload
    FactoryGirl.create(:comment, attendee: susan, commentable: message)
    message.reload
    FactoryGirl.create(:comment, attendee: mary, commentable: message)
    message.reload
    assert_difference('Notification.count', 3) do
      FactoryGirl.create(:comment, attendee: susan, commentable: message)
    end
    message.reload
    assert Notification.where(attendee: michael, resource: message).size == 4, "Michael was not notified"
    assert Notification.where(attendee: bob, resource: message).size == 3, "Bob was not notified"
    assert Notification.where(attendee: mary, resource: message).size == 1, "Mary was not notified"
    assert Notification.where(attendee: susan, resource: message).size == 1, "Susan was not notified"
  end

  should "not notify post owner" do
    michael = FactoryGirl.create(:guest)
    message = FactoryGirl.create(:message, attendee: michael)
    assert_no_difference('Notification.count') do
      FactoryGirl.create(:comment, attendee: michael, commentable: message)
    end
  end
end
