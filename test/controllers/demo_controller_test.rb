require 'test_helper'

class DemoControllerTest < ActionController::TestCase

	setup do
		wedding = FactoryGirl.create(:demo_wedding)
		bride = FactoryGirl.create(:bride, wedding: wedding)
	end

	test "should sign in as the demo wedding bride" do
		get :show
		assert assigns(:current_attendee).is_bride?, "User is not signed in as bride"
		assert assigns(:current_attendee).wedding.slug == "demo", "User is not signed in in the demo wedding"
	end

	test "should be redirected to wedding homepage" do
		get :show
		assert_redirected_to home_path
	end

end
