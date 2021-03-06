class TablesController < ApplicationController
  before_action :require_user
  load_and_authorize_resource except: [:new, :create]
  authorize_resource only: [:new, :create]
  before_action :set_autocomplete_data, only: [:new, :edit]

  # GET /tables
  # GET /tables.json
  def index
    @tables = current_attendee.wedding.tables
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)
    @table.wedding = current_attendee.wedding

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Mesa creada correctamente' }
        format.json { render action: 'show', status: :created, location: @table }
      else
        format.html { render action: 'new' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Mesa actualizada correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    def set_autocomplete_data
      @autocomplete_data = current_attendee.wedding.attendees.map { |a| {label: "#{a.username} - #{a.description}", value: a.id} }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, attendee_ids: [])
    end
end
