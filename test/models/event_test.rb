require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "should not save without name" do
    event = FactoryGirl.build(:event, name: nil)
    assert_not event.save, "Saved without name"
  end

  test "should not save without description" do
    event = FactoryGirl.build(:event, description: nil)
    assert_not event.save, "Saved without description"
  end

  test "should not save without location" do
    event = FactoryGirl.build(:event, location: nil)
    assert_not event.save, "Saved without location"
  end

  test "should not save without datetime" do
    event = FactoryGirl.build(:event, datetime: nil)
    assert_not event.save, "Saved without datetime"
  end

  test "should not save without wedding" do
    event = FactoryGirl.build(:event, wedding: nil)
    assert_not event.save, "Saved without wedding"
  end

  test "should be destroyed on wedding destroy" do
  	wedding = FactoryGirl.create(:wedding)
  	3.times {FactoryGirl.create(:event, wedding: wedding)}
  	assert_difference("Event.all.size", -3) do
  		wedding.destroy
  	end
  end
end
