require 'test_helper'

class DancesControllerTest < ActionController::TestCase
  setup do
    @dance = dances(:one)
    @user1 = users(:one)
    @user2 = users(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dance" do
    assert_difference('Dance.count') do
      post :create, dance: { partner_id: @user1.id, time: @dance.time, user_id: @user2.id }
    end

    assert_redirected_to dance_path(assigns(:dance))
  end

  test "should show dance" do
    get :show, id: @dance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dance
    assert_response :success
  end

  test "should update dance" do
    patch :update, id: @dance, dance: { partner_id: @user1.id, time: @dance.time, user_id: @user2.id }
    assert_redirected_to dance_path(assigns(:dance))
  end

  test "should destroy dance" do
    assert_difference('Dance.count', -1) do
      delete :destroy, id: @dance
    end

    assert_redirected_to dances_path
  end
end
