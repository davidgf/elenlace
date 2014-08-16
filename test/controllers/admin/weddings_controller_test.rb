require 'test_helper'

class Admin::WeddingsControllerTest < ActionController::TestCase

    context "a guest user" do
        
      setup do
        @wedding = FactoryGirl.create(:wedding)
      end

      should "get redirected on index" do
        get :index
        assert_redirected_to admin_log_in_path
      end

      should "get redirected on new" do
        get :new
        assert_redirected_to admin_log_in_path
      end

      should "get redirected on create" do
        post :create, wedding: { bride_name: 'bride', groom_name: 'groom'  }
        assert_redirected_to admin_log_in_path
      end

      should "get redirected on show" do
        get :show, id: @wedding
        assert_redirected_to admin_log_in_path
      end

      should "get redirected on edit" do
        get :edit, id: @wedding
        assert_redirected_to admin_log_in_path
      end

      should "get redirected on update" do
        patch :update, id: @wedding, wedding: {  }
        assert_redirected_to admin_log_in_path
      end

      should "get redirected on destroy" do
        delete :destroy, id: @wedding
        assert_redirected_to admin_log_in_path
      end
    end


    context "an admin" do
        
      setup do
        @wedding = FactoryGirl.create(:wedding)
        @groom = FactoryGirl.build(:groom)
        @bride = FactoryGirl.build(:bride)
        sign_in
      end

      should "get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:weddings)
      end

      should "get new" do
        get :new
        assert_response :success
      end

      should "create wedding" do
        assert_difference('Wedding.count') do
          post :create, wedding: { groom_attributes: {username: @groom.username, password: @groom.password},
                                   bride_attributes: {username: @bride.username, password: @bride.password},
                                   bride_name: 'bride', groom_name: 'groom' }
        end

        assert_redirected_to admin_wedding_path(assigns(:wedding))
      end

      should "show wedding" do
        get :show, id: @wedding
        assert_response :success
      end

      should "get edit" do
        get :edit, id: @wedding
        assert_response :success
      end

      should "update wedding" do
        patch :update, id: @wedding, wedding: {  groom_attributes: {username: @groom.username, password: @groom.password},
                                   bride_attributes: {username: @bride.username, password: @bride.password} }
        assert_redirected_to admin_wedding_path(assigns(:wedding))
      end

      should "destroy wedding" do
        assert_difference('Wedding.count', -1) do
          delete :destroy, id: @wedding
        end

        assert_redirected_to admin_weddings_path
      end
    end
end