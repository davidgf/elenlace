class NotificationsController < ApplicationController
	before_filter :require_user

	def index
		@notifications = current_attendee.notifications
	end
end