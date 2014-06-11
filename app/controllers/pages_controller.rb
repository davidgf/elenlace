class PagesController < ApplicationController
  def home
    if not current_user
        redirect_to log_in_path
    end
  end
end
