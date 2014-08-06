require 'test_helper'

class PagesControllerTest < ActionController::TestCase

	test "should get landing page if not authenticated" do
		sign_out
		get :landing
		assert_template "landing"
	end
end
