require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    user = FactoryGirl.create(:guest)
    @picture = FactoryGirl.create(:picture, attendee: user)
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
    image_path = "#{Rails.root}/test/images/dys.png"
    image = Rack::Test::UploadedFile.new(image_path, "image/png")
    assert_difference('Picture.count') do
      post :create, picture: { name: @picture.name, attendee_id: @picture.attendee_id, image: image }
    end

    assert_redirected_to pictures_path
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
    patch :update, id: @picture, picture: { name: @picture.name, attendee_id: @picture.attendee_id }
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
