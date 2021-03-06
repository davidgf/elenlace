require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    user = FactoryGirl.create(:guest)
    @message = FactoryGirl.create(:message, attendee: user)
    cookies[:auth_token] = user.auth_token
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { datetime: @message.datetime, message: @message.message, attendee_id: @message.attendee_id }
    end

    assert_redirected_to messages_path
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update message" do
    patch :update, id: @message, message: { datetime: @message.datetime, message: @message.message, attendee_id: @message.attendee_id }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end

  test "should upvote message" do
    assert_difference('@message.votes_for.up.size', +1) do
      post :upvote, id: @message
    end
    assert_redirected_to message_path(assigns(:message))
  end

  test "should downvote message" do
    assert_difference('@message.votes_for.down.size', +1) do
      post :downvote, id: @message
    end
    assert_redirected_to message_path(assigns(:message))
  end

end
