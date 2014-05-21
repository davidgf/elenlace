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
end
