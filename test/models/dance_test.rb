require 'test_helper'

class DanceTest < ActiveSupport::TestCase
  
  test "should not save without user" do
    dance = FactoryGirl.build(:dance, user: nil)
    assert_not dance.save, "Saved without user"
  end

  test "should not save without partner" do
    dance = FactoryGirl.build(:dance, partner: nil)
    assert_not dance.save, "Saved without partner"
  end
end
