require 'test_helper'

class EventsControllerTest < ActionController::TestCase

    context "a guest" do
        setup do
          @guest = set_current_attendee(:guest)
          @event = FactoryGirl.create(:event, wedding: @guest.wedding)
        end

      should "get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:events)
      end

      should "not get new" do
        get :new
        assert_response :forbidden
      end

      should "not create event" do
        post :create, event: FactoryGirl.build(:event).attributes
        assert_response :forbidden
      end

      should "show event" do
        get :show, id: @event
        assert_response :success
      end

      should "not get edit" do
        get :edit, id: @event
        assert_response :forbidden
      end

      should "not update event" do
        patch :update, id: @event, event: { description: "new desc" }
        assert_response :forbidden
      end

      should "not destroy event" do
        delete :destroy, id: @event
        assert_response :forbidden
      end
    end

    context "a groom/bride" do
        setup do
          @bride = set_current_attendee(:bride)
          @event = FactoryGirl.create(:event, wedding: @bride.wedding)
        end

      should "get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:events)
      end

      should "get new" do
        get :new
        assert_response :success
      end

      should "create event" do
        assert_difference('Event.count') do
          @new_event = FactoryGirl.build(:event, wedding: nil)
          post :create, event: {datetime: "2014-05-22 18:01:33", description: "MyText", name: "Evname", location_attributes: {name: "myloc"}}
        end

        assert_redirected_to event_path(assigns(:event))
      end

      should "show event" do
        get :show, id: @event
        assert_response :success
      end

      should "get edit" do
        get :edit, id: @event
        assert_response :success
      end

      should "update event" do
        patch :update, id: @event, event: { description: "new desc" }
        assert_redirected_to event_path(assigns(:event))
      end

      should "destroy event" do
        assert_difference('Event.count', -1) do
          delete :destroy, id: @event
        end

        assert_redirected_to events_path
      end
    end
  
end
