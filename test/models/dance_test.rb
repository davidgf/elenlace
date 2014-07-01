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

  test "should find matches" do
    guest1 = FactoryGirl.create(:guest)
    guest2 = FactoryGirl.create(:guest)
    guest3 = FactoryGirl.create(:guest)
    guest4 = FactoryGirl.create(:guest)
    dance1 = FactoryGirl.create(:dance, attendee: guest1, partner: guest2)
    dance3 = FactoryGirl.create(:dance, attendee: guest1, partner: guest3)
    dance3 = FactoryGirl.create(:dance, attendee: guest1, partner: guest4)
    dance2 = FactoryGirl.create(:dance, attendee: guest2, partner: guest1)
    dance3 = FactoryGirl.create(:dance, attendee: guest3, partner: guest1)
    matches = Dance.matches_of guest1
    assert matches.size == 2, "Wrong number of matches"
    assert_equal matches.first.partner, guest2, "Incorrect partner"
  end

end
