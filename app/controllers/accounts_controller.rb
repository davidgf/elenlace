class AccountsController < ApplicationController

    before_action :require_user

    def show
    end

    def edit
    end

    def update
        if current_user.update(attendee_params)
            redirect_to account_path
        else
            render action: 'edit'
        end
    end

private

    def attendee_params
      params.require(:attendee).permit(:description, :avatar)
    end
end