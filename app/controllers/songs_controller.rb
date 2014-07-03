class SongsController < ApplicationController

  before_action :require_user
  before_action :set_wedding
  load_and_authorize_resource

  def new
    @song = Song.new
  end

  def show
  end

  def create
    @song.wedding = @wedding

    respond_to do |format|
      if @song.save
        format.html { redirect_to dances_path, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
