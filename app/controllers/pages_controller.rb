class PagesController < ApplicationController

  before_action :require_user
  before_action :set_wedding

  def home
    @resources = PublicActivity::Activity.order("created_at desc").page(params[:page]).per_page(15)
    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'last_activity', object: @resources, layout: false
          end
        }
    end
  end

  def wedding
  end

  def events
  end
end
