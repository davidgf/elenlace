require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

    setup do
        
    end

    test "should redirect to log in page if not authenticated" do
        ensure_not_authenticated
        get :show
        assert_redirected_to log_in_path
        get :update
        assert_redirected_to log_in_path
        get :edit
        assert_redirected_to log_in_path
    end

    test "should show current attendee" do
        attendee = set_current_attendee(:guest)
        get :show
        assert_response :success
    end

    test "should get edit" do
        attendee = set_current_attendee(:guest)
        get :edit
        assert_response :success
    end

    test "should update description" do
        attendee = set_current_attendee(:guest)
        new_description = "This is my new description"
        put :update, attendee: {description: new_description}
        attendee.reload
        assert_equal new_description, attendee.description, "Description not updated"
        assert_redirected_to account_path
    end
end