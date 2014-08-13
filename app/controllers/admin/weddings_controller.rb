class Admin::WeddingsController < ApplicationController
  layout "admin"
  before_action :require_admin_user
  before_action :set_wedding, only: [:show, :edit, :update, :destroy]

  # GET /admin/weddings
  # GET /admin/weddings.json
  def index
    @weddings = Wedding.all
  end

  # GET /admin/weddings/1
  # GET /admin/weddings/1.json
  def show
  end

  # GET /admin/weddings/new
  def new
    @wedding = Wedding.new
    @wedding.build_groom
    @wedding.build_bride
  end

  # GET /admin/weddings/1/edit
  def edit
  end

  # POST /admin/weddings
  # POST /admin/weddings.json
  def create
    @wedding = Wedding.new(wedding_params)

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to admin_wedding_path(@wedding), notice: 'Wedding was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wedding }
      else
        format.html { render action: 'new' }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/weddings/1
  # PATCH/PUT /admin/weddings/1.json
  def update
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to admin_wedding_path(@wedding), notice: 'Wedding was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/weddings/1
  # DELETE /admin/weddings/1.json
  def destroy
    @wedding.destroy
    respond_to do |format|
      format.html { redirect_to admin_weddings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_params
      params.require(:wedding).permit(bride_attributes: [:username, :password], groom_attributes: [:username, :password])
    end
end
