require 'test_helper'

class WeddingUserTest < ActiveSupport::TestCase

  test "should not update role" do
    user = FactoryGirl.create(:wedding_user)
    user.role = "something else"
    assert_not user.save, "Role updated"
  end
end