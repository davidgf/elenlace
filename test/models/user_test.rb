require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save without name" do
    user = FactoryGirl.build(:user, username: nil)
    assert_not user.save, "Saved without name"
  end

  test "should not update role" do
    user = FactoryGirl.create(:user)
    user.role = "something else"
    assert_not user.save, "Role updated"
  end

  test "should have right role" do
    admin = FactoryGirl.build(:admin)
    groom = FactoryGirl.build(:groom)
    guest = FactoryGirl.build(:guest)
    assert admin.is_admin?, "Admin has no admin role"
    assert groom.is_groom?, "Groom has no groom role"
    assert guest.is_guest?, "Guest has no guest role"
  end
end
