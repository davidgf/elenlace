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

  test "should be destroyed on wedding destroy" do
  	wedding = FactoryGirl.create(:wedding)
  	3.times {FactoryGirl.create(:song, wedding: wedding)}
  	assert_difference("Song.all.size", -3) do
  		wedding.destroy
  	end
  end
end
