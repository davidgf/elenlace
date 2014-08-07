class Admin::WeddingsController < ApplicationController
  layout "admin"
  before_action :set_admin_wedding, only: [:show, :edit, :update, :destroy]

  # GET /admin/weddings
  # GET /admin/weddings.json
  def index
    @admin_weddings = Admin::Wedding.all
  end

  # GET /admin/weddings/1
  # GET /admin/weddings/1.json
  def show
  end

  # GET /admin/weddings/new
  def new
    @admin_wedding = Admin::Wedding.new
  end

  # GET /admin/weddings/1/edit
  def edit
  end

  # POST /admin/weddings
  # POST /admin/weddings.json
  def create
    @admin_wedding = Admin::Wedding.new(admin_wedding_params)

    respond_to do |format|
      if @admin_wedding.save
        format.html { redirect_to @admin_wedding, notice: 'Wedding was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_wedding }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/weddings/1
  # PATCH/PUT /admin/weddings/1.json
  def update
    respond_to do |format|
      if @admin_wedding.update(admin_wedding_params)
        format.html { redirect_to @admin_wedding, notice: 'Wedding was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/weddings/1
  # DELETE /admin/weddings/1.json
  def destroy
    @admin_wedding.destroy
    respond_to do |format|
      format.html { redirect_to admin_weddings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_wedding
      @admin_wedding = Admin::Wedding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_wedding_params
      params[:admin_wedding]
    end
end
