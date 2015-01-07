require 'test_helper'

class WeddingsControllerTest < ActionController::TestCase

  context "a guest" do
    setup do
      @guest = set_current_attendee(:guest)
      @wedding = @guest.wedding
      # @controller = WeddingsController.new
    end

	should "not get edit" do
		get :edit
		assert_response :forbidden
	end

	should "not update wedding" do
		patch :update, wedding: {  }
		assert_response :forbidden
	end
  end

  context "a groom/bride" do
    setup do
      @bride = set_current_attendee(:bride)
      @wedding = @bride.wedding
    end

	should "get edit" do
		get :edit
		assert_response :success
	end

	should "update wedding" do
		patch :update, wedding: { test: 'test' }
		assert_redirected_to home_path
	end
  end

end
