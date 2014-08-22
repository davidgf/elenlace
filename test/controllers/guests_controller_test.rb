require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    user = FactoryGirl.create(:bride)
    cookies[:auth_token] = user.auth_token
    @guest = FactoryGirl.create(:guest, wedding: user.wedding)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, guest: {  description: @guest.description, table_id: @guest.table_id, role: @guest.role, username: @guest.username, password: "somepass" }
    end

    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should show guest" do
    get :show, id: @guest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest
    assert_response :success
  end

  test "should update guest" do
    patch :update, id: @guest, guest: {  description: @guest.description, table_id: @guest.table_id, role: @guest.role, username: @guest.username }
    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, id: @guest
    end

    assert_redirected_to guests_path
  end
end
