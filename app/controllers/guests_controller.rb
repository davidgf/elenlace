class GuestsController < ApplicationController
  before_action :require_user
  before_action :set_guest, except: [:index, :new, :create]
  authorize_resource
  # load_and_authorize_resource

  # GET /guests
  # GET /guests.json
  def index
    @guests = current_attendee.wedding.guests.page(params[:page])
    @tables = current_attendee.wedding.tables
    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'guests', object: @guests, layout: false
          end
        }
    end
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  def messages
    @messages = @guest.messages.order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'messages/messages', object: @messages, layout: false
          end
        }
    end
  end

  def pictures
    @pictures = @guest.pictures.order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'pictures/pictures', object: @pictures, layout: false
          end
        }
    end
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
    if current_attendee.is_guest?
      redirect_to edit_account_path
    end
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
    @guest.wedding = current_attendee.wedding

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Invitado creado correctamente' }
        format.json { render action: 'show', status: :created, location: @guest }
      else
        format.html { render action: 'new' }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Invitado actualizado correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:username, :description, :table_id, :password, :avatar)
    end
end
