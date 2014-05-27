require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save without name" do
    user = FactoryGirl.build(:user, username: nil)
    assert_not user.save, "Saved without name"
  end

  test "should not save without wedding" do
    groom = FactoryGirl.build(:groom, wedding: nil)
    bride = FactoryGirl.build(:bride, wedding: nil)
    guest = FactoryGirl.build(:guest, wedding: nil)
    assert_not groom.save, "Groom saved without wedding"
    assert_not bride.save, "Bride saved without wedding"
    assert_not guest.save, "Guest saved without wedding"
  end

  test "should not update role" do
    user = FactoryGirl.create(:user)
    user.role = "something else"
    assert_not user.save, "Role updated"
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
end
