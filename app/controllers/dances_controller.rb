class DancesController < ApplicationController
  before_action :require_user
  before_action :set_wedding, only: [:index, :new, :edit, :create]
  load_and_authorize_resource except: :new

  # GET /dances
  # GET /dances.json
  def index
    @dances = current_attendee.dances
    @partner_of = Dance.where(:partner => current_attendee)
    @matches = Dance.matches_of current_attendee
    @songs = @wedding.songs
  end

  # GET /dances/1
  # GET /dances/1.json
  def show
  end

  # GET /dances/new
  def new
    @dance = Dance.new
  end

  # GET /dances/1/edit
  def edit
  end

  # POST /dances
  # POST /dances.json
  def create
    @dance = Dance.new(dance_params)
    @dance.attendee = current_attendee

    respond_to do |format|
      if @dance.save
        format.html { redirect_to dances_path, notice: 'Has elegido a tu pareja!' }
        format.json { render action: 'show', status: :created, location: @dance }
      else
        format.html { render action: 'new' }
        format.json { render json: @dance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dances/1
  # PATCH/PUT /dances/1.json
  def update
    respond_to do |format|
      if @dance.update(dance_params)
        format.html { redirect_to @dance, notice: 'Has actualizado tu elección de pareja' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dances/1
  # DELETE /dances/1.json
  def destroy
    @dance.destroy
    respond_to do |format|
      format.html { redirect_to dances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dance
      @dance = Dance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dance_params
      params.require(:dance).permit(:partner_id, :time)
    end

    def set_autocomplete_data
      @autocomplete_data = current_attendee.wedding.attendees.map { |a| {label: a.username, value: a.id} }
    end
end
