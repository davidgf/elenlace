require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @bob = set_current_attendee(:guest)
    @susan = FactoryGirl.create(:guest, wedding: @bob.wedding)
    @michael = FactoryGirl.create(:guest, wedding: @bob.wedding)
    @bobs_picture = FactoryGirl.create(:picture, attendee: @bob)
    FactoryGirl.create(:comment, commentable: @bobs_picture, attendee: @susan)
    FactoryGirl.create(:comment, commentable: @bobs_picture, attendee: @michael)
    @bob.reload
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
    # assert assigns(:notifications).size == 2
  end

  test "should read notification if AJAX" do
    notification_id = @bob.notifications.first.id
    xhr :post, :read, id: notification_id
    assert Notification.find(notification_id).read, "Notification is not read"
  end

  test "should redirect to root if not AJAX" do
    post :read, id: 1
    assert_redirected_to root_path
  end

  test "should read all notifications" do
    xhr :post, :read_all
    @bob.notifications.each do |n|
      assert n.read, "Notification is not read"
    end
  end

  test "should redirect to index if not AJAX in read all" do
    post :read_all
    @bob.notifications.each do |n|
      assert n.read, "Notification is not read"
    end
    assert_redirected_to notifications_path
  end

end
