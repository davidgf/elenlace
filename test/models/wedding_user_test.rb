require 'test_helper'

class WeddingUserTest < ActiveSupport::TestCase

  test "should not update role" do
    user = FactoryGirl.create(:wedding_user)
    user.role = "something else"
    assert_not user.save, "Role updated"
  end

  test "should not save without password" do
    wedding_user = FactoryGirl.build(:wedding_user, password: nil)
    assert_not wedding_user.save, "Wedding user saved without password"
  end

  test "password should be unique in one wedding" do
    wedding = FactoryGirl.create(:wedding)
    wedding_user = FactoryGirl.create(:bride, password: "mypass", wedding: wedding)
    new_wedding_user = FactoryGirl.build(:groom, password: "mypass", wedding: wedding)
    assert_not new_wedding_user.save, "Wedding user saved with not unique password"
  end

  test "should generate auth token" do
    wedding_user = FactoryGirl.build(:wedding_user, auth_token: nil)
    wedding_user.save
    assert_not_nil wedding_user.auth_token, "Auth token not generated"
  end

  test "should authenticate with correct pass" do
    wedding_user = FactoryGirl.create(:wedding_user, password: "pass")
    wedding_user_auth = WeddingUser.authenticate(wedding_user.wedding_id, "pass")
    assert_equal wedding_user, wedding_user_auth, "User not authenticated"
  end

  test "should now authenticate with wrong pass" do
    wedding_user = FactoryGirl.create(:wedding_user, password: "pass")
    assert_nil WeddingUser.authenticate(wedding_user.wedding_id, "wrong pass"), "User authenticated"
  end
end