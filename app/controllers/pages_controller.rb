class PagesController < ApplicationController

  before_action :require_user, except: :landing
  before_action :set_wedding, except: :landing

  def landing
    if current_attendee
      redirect_to home_path
    elsif current_user
      redirect_to admin_dashboard_path
    end

  end

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

  def gallery
    if params[:order] == "votes"
      @pictures_urls = Picture.order(cached_votes_score: :desc).map {|p| p.image.url(:big)}
    else
      @pictures_urls = Picture.order(created_at: :desc).map {|p| p.image.url(:big)}
    end

    render layout: false
  end
end
