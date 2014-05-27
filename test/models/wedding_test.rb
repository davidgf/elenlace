require 'test_helper'

class WeddingTest < ActiveSupport::TestCase
  test "guests are removed on wedding deletion" do
    groom = FactoryGirl.build(:groom)
    bride = FactoryGirl.build(:bride)
    guest = FactoryGirl.build(:guest)
    wedding = FactoryGirl.create(:wedding, bride: bride, groom: groom, guests: [guest])
    assert_difference('User.count', -3) do
      wedding.destroy
    end
  end
end
