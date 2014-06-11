require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = FactoryGirl.create(:guest)
  end

  test "should get index" do
    get :index, wedding_id: @guest.wedding
    assert_response :success
    assert_not_nil assigns(:guests)
    assert_not_nil assigns(:wedding)
  end

  test "should get new" do
    get :new, wedding_id: @guest.wedding
    assert_response :success
    assert_not_nil assigns(:wedding)
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, wedding_id: @guest.wedding, guest: {  description: @guest.description, table_id: @guest.table_id, role: @guest.role, username: @guest.username, password: "somepass" }
    end

    assert_not_nil assigns(:wedding)
    assert_redirected_to wedding_guest_path(assigns(:wedding), assigns(:guest))
  end

  test "should show guest" do
    get :show, wedding_id: @guest.wedding, id: @guest
    assert_response :success
    assert_not_nil assigns(:wedding)
  end

  test "should get edit" do
    get :edit, wedding_id: @guest.wedding, id: @guest
    assert_response :success
    assert_not_nil assigns(:wedding)
  end

  test "should update guest" do
    patch :update, wedding_id: @guest.wedding, id: @guest, guest: {  description: @guest.description, table_id: @guest.table_id, role: @guest.role, username: @guest.username }
    assert_not_nil assigns(:wedding)
    assert_redirected_to wedding_guest_path(assigns(:wedding), assigns(:guest))
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, id: @guest, wedding_id: @guest.wedding
    end

    assert_not_nil assigns(:wedding)
    assert_redirected_to wedding_guests_path
  end
end
