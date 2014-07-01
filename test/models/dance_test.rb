require 'test_helper'

class DanceTest < ActiveSupport::TestCase
  
  test "should not save without user" do
    dance = FactoryGirl.build(:dance, attendee: nil)
    assert_not dance.save, "Saved without user"
  end

  test "should not save without partner" do
    dance = FactoryGirl.build(:dance, partner: nil)
    assert_not dance.save, "Saved without partner"
  end

  test "the partner should be unique" do
      attendee = FactoryGirl.create(:guest)
      partner = FactoryGirl.create(:guest)
      dance = FactoryGirl.create(:dance, attendee: attendee, partner: partner)
      dupe_dance = FactoryGirl.build(:dance, attendee: attendee, partner: partner)
      assert_not dupe_dance.save, "Dance was saved with same partner"
  end

end
