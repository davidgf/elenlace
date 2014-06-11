require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    @picture = FactoryGirl.create(:picture)
    user = FactoryGirl.create(:wedding_user)
    cookies[:auth_token] = user.auth_token
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post :create, picture: { name: @picture.name, user_id: @picture.user_id }
    end

    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should show picture" do
    get :show, id: @picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picture
    assert_response :success
  end

  test "should update picture" do
    patch :update, id: @picture, picture: { name: @picture.name, user_id: @picture.user_id }
    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: @picture
    end

    assert_redirected_to pictures_path
  end

  test "should upvote picture" do
    assert_difference('@picture.votes_for.up.size', +1) do
      post :upvote, id: @picture
    end
    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should downvote picture" do
    assert_difference('@picture.votes_for.down.size', +1) do
      post :downvote, id: @picture
    end
    assert_redirected_to picture_path(assigns(:picture))
  end
end
