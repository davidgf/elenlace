class NotificationsController < ApplicationController
    before_filter :require_user
    before_filter :redirect_if_not_ajax, except: :index

    def index
        @notifications = current_attendee.notifications.where(read: false)
        @notifications.update_all(read: true)
    end

    def read
        Notification.find(params[:id]).update_attribute(:read, true)
        render text: 'ok'
    end

    def read_all
        Notification.where(attendee: current_attendee).update_all(read: true)
        render text: 'ok'
    end

private
    def redirect_if_not_ajax
        if not request.xhr?
            redirect_to root_path
        end
    end
end