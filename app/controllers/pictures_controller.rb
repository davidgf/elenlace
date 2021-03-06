class PicturesController < ApplicationController
  before_action :require_user
  before_action :set_wedding
  load_and_authorize_resource except: [:new, :create]
  authorize_resource only: [:new, :create]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @wedding.pictures.order('created_at DESC').page(params[:page])
    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'pictures', object: @pictures, layout: false
          end
        }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    @picture.attendee = current_attendee

    respond_to do |format|
      if @picture.save
        @picture.create_activity :create, owner: @picture.attendee if (current_attendee.is_groom? or current_attendee.is_bride?)
        format.html { redirect_to pictures_path, notice: 'Foto subida correctamente' }
        format.json { render action: 'show', status: :created, location: @picture }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Foto actualizada' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  def upvote
    @picture.upvote_by current_attendee.becomes(Attendee)
    respond_to do |format|
      format.html { redirect_to @picture, notice: 'Foto votada positivamente' }
      format.json
    end
  end

  def downvote
    @picture.downvote_by current_attendee.becomes(Attendee)
    respond_to do |format|
      format.html { redirect_to @picture, notice: 'Foto votada negativamente' }
      format.json
    end
  end

  def comment
    @picture.comments.create(params[:picture][:comment])
    redirect_to pictures_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :image, comment_attributes: [:comment])
    end
end
