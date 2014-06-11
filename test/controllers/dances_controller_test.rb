require 'test_helper'

class DancesControllerTest < ActionController::TestCase
  setup do
    @partner = FactoryGirl.create(:guest, password: "pass1")
    user = FactoryGirl.create(:guest, password: "pass2")
    cookies[:auth_token] = user.auth_token
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
      post :create, dance: { partner_id: @partner.id }
    end

    assert_redirected_to dance_path(assigns(:dance))
  end

  test "should show dance" do
    @dance = FactoryGirl.create(:dance)
    get :show, id: @dance
    assert_response :success
  end

  test "should get edit" do
    @dance = FactoryGirl.create(:dance)
    get :edit, id: @dance
    assert_response :success
  end

  test "should update dance" do
    @dance = FactoryGirl.create(:dance)
    patch :update, id: @dance, dance: { partner_id: @partner.id, time: @dance.time }
    assert_redirected_to dance_path(assigns(:dance))
  end

  test "should destroy dance" do
    @dance = FactoryGirl.create(:dance)
    assert_difference('Dance.count', -1) do
      delete :destroy, id: @dance
    end

    assert_redirected_to dances_path
  end
end
