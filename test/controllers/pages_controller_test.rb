require 'test_helper'

class PagesControllerTest < ActionController::TestCase

    context "a guest user" do
        setup do
            sign_out
        end

    	should "get landing page" do
    		get :landing
            assert_response :success
    		assert_template "landing"
    	end
    end

    context "an admin user" do
        setup do
            sign_in
        end

        should "get redirected to admin dashboard" do
            get :landing
            assert_redirected_to admin_dashboard_path
        end
    end
end
