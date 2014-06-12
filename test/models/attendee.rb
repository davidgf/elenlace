require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase

  test "should not save without wedding" do
    groom = FactoryGirl.build(:groom, wedding: nil)
    bride = FactoryGirl.build(:bride, wedding: nil)
    guest = FactoryGirl.build(:guest, wedding: nil)
    assert_not groom.save, "Groom saved without wedding"
    assert_not bride.save, "Bride saved without wedding"
    assert_not guest.save, "Guest saved without wedding"
  end

  test "should have right role" do
    admin = FactoryGirl.build(:admin)
    groom = FactoryGirl.build(:groom)
    bride = FactoryGirl.build(:bride)
    guest = FactoryGirl.build(:guest)
    assert admin.is_admin?, "Admin has no admin role"
    assert groom.is_groom?, "Groom has no groom role"
    assert bride.is_bride?, "Bride has no bride role"
    assert guest.is_guest?, "Guest has no guest role"
  end

  test "should not update role" do
    user = FactoryGirl.create(:attendee)
    user.role = "something else"
    assert_not user.save, "Role updated"
  end

  test "should not save without password" do
    attendee = FactoryGirl.build(:attendee, password: nil)
    assert_not attendee.save, "Wedding user saved without password"
  end

  test "password should be unique in one wedding" do
    wedding = FactoryGirl.create(:wedding)
    attendee = FactoryGirl.create(:bride, password: "mypass", wedding: wedding)
    new_attendee = FactoryGirl.build(:groom, password: "mypass", wedding: wedding)
    assert_not new_attendee.save, "Wedding user saved with not unique password"
  end

  test "should generate auth token" do
    attendee = FactoryGirl.build(:attendee, auth_token: nil)
    attendee.save
    assert_not_nil attendee.auth_token, "Auth token not generated"
  end

  test "should authenticate with correct pass" do
    attendee = FactoryGirl.create(:attendee, password: "pass")
    attendee_auth = Attendee.authenticate(attendee.wedding_id, "pass")
    assert_equal attendee, attendee_auth, "User not authenticated"
  end

  test "should now authenticate with wrong pass" do
    attendee = FactoryGirl.create(:attendee, password: "pass")
    assert_nil Attendee.authenticate(attendee.wedding_id, "wrong pass"), "User authenticated"
  end
end