require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase

    context "a guest user" do
        setup do
            sign_out
        end

        should "get redirected to admin log in" do
            get :index
            assert_redirected_to admin_log_in_path
        end
    end

    context "an admin user" do
        setup do
            sign_in_as(FactoryGirl.create(:admin))
        end

        should "get dashboard" do
            get :index
            assert_response :success
            assert_template "index", layout: "admin"
        end

    end
end
