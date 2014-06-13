require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  test "should not save without user" do
    picture = FactoryGirl.build(:picture, attendee: nil)
    assert_not picture.save, "Saved without user"
  end

end
