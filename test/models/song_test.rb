require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "should not save without user" do
    song = FactoryGirl.build(:song, attendee: nil)
    assert_not song.save, "Saved without user"
  end

  test "should not save without wedding" do
    song = FactoryGirl.build(:song, attendee: nil)
    assert_not song.save, "Saved without wedding"
  end
end
