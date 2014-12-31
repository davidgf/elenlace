class DemoController < ApplicationController
    before_action :set_demo_wedding

    def show
        @current_attendee = @wedding.bride
        cookies.permanent[:auth_token] = @current_attendee.auth_token
        redirect_to home_url
    end

private

	def set_demo_wedding
        @wedding = Wedding.friendly.find('demo')
    end
end
