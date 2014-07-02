class PagesController < ApplicationController

  before_action :require_user
  before_action :set_wedding

  def home
    @messages = @wedding.messages.where(attendee_id: [@wedding.bride, @wedding.groom])
    @pictures = @wedding.pictures.where(attendee_id: [@wedding.bride, @wedding.groom])
    @resources = @messages + @pictures
  end

  def wedding
  end

  def events
  end
end
