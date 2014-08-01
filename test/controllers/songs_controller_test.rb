require 'test_helper'

class SongsControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:guest)
    cookies[:auth_token] = @user.auth_token
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
