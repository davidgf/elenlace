class NotificationsController < ApplicationController
    before_filter :require_user
    before_filter :redirect_if_not_ajax, only: [:read]
    before_action :set_notification, only: [:show]

    def index
        @notifications = current_attendee.notifications.where(read: false)
    end

    def show
        @notification.update(read: true)
        redirect_to @notification.resource
    end

    def read
        Notification.find(params[:id]).update_attribute(:read, true)
        render text: 'ok'
    end

    def read_all
        Notification.where(attendee: current_attendee).update_all(read: true)
        if request.xhr?
            render text: 'ok'
        else
            redirect_to action: :index
        end
    end

private
    def redirect_if_not_ajax
        if not request.xhr?
            redirect_to root_path
        end
    end

    def set_notification
      @notification = Notification.find(params[:id])
    end
end