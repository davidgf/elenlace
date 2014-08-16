require 'test_helper'

class WeddingTest < ActiveSupport::TestCase

  def setup
    @groom = FactoryGirl.build(:groom, wedding: nil)
    @bride = FactoryGirl.build(:bride, wedding: nil)
    @guest = FactoryGirl.build(:guest, wedding: nil)
  end

  test "attendees are removed on wedding deletion" do
    wedding = FactoryGirl.create(:wedding, bride: @bride, groom: @groom)
    wedding.guests << @guest
    assert_difference('Attendee.count', -3) do
      wedding.destroy
    end
  end

  test "tables are removed on wedding deletion" do
    table = FactoryGirl.create(:table)
    assert_difference('Table.count', -1) do
      table.wedding.destroy
    end
  end

  test "songs are removed on wedding deletion" do
    song = FactoryGirl.create(:song)
    assert_difference('Song.count', -1) do
      song.wedding.destroy
    end
  end

  test "cannot be saved without the groom name" do
    w = FactoryGirl.build(:wedding, groom_name: nil)
    assert_not w.save, "Wedding saved without groom name"
  end

  test "cannot be saved without the bride name" do
    w = FactoryGirl.build(:wedding, bride_name: nil)
    assert_not w.save, "Wedding saved without bride name"
  end

end
