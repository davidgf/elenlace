class PagesController < ApplicationController

  before_action :require_user
  before_action :set_wedding

  def home
    @resources = PublicActivity::Activity.order("created_at desc")
  end

  def wedding
  end

  def events
  end
end
