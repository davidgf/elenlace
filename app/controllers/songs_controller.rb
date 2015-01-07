class SongsController < ApplicationController

  before_action :require_user
  before_action :set_wedding
  load_and_authorize_resource except: [:new, :create]
  authorize_resource only: :create

  def new
    @song = Song.new
  end

  def show
  end

  def create
    @song = Song.new(song_params)
    @song.wedding = @wedding
    @song.attendee = current_attendee

    respond_to do |format|
      if @song.save
        format.html { redirect_to dances_path, notice: 'Canción enviada correctamente' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def upvote
    @song.upvote_by current_attendee.becomes(Attendee)
    respond_to do |format|
      format.html { redirect_to dances_path, notice: 'Canción votada positivamente' }
      format.json
    end
  end

  def downvote
    @song.downvote_by current_attendee.becomes(Attendee)
    respond_to do |format|
      format.html { redirect_to dances_path, notice: 'Canción votada negativamente' }
      format.json
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist, :video_url)
    end
end
