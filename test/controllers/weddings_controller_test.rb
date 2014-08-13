# require 'test_helper'

# class WeddingsControllerTest < ActionController::TestCase
#   setup do
#     @wedding = FactoryGirl.create(:wedding)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:weddings)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create wedding" do
#     assert_difference('Wedding.count') do
#       post :create, wedding: {  }
#     end

#     assert_redirected_to wedding_path(assigns(:wedding))
#   end

#   test "should show wedding" do
#     get :show, id: @wedding
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @wedding
#     assert_response :success
#   end

#   test "should update wedding" do
#     patch :update, id: @wedding, wedding: {  }
#     assert_redirected_to wedding_path(assigns(:wedding))
#   end

#   test "should destroy wedding" do
#     assert_difference('Wedding.count', -1) do
#       delete :destroy, id: @wedding
#     end

#     assert_redirected_to weddings_path
#   end
# end
