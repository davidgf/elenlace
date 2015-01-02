class WeddingsController < ApplicationController
  before_action :require_user
  before_action :set_wedding
  load_and_authorize_resource

  # GET /weddings/1/edit
  def edit
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to @wedding, notice: 'Boda actualizada correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_params
      params.require(:wedding).permit(:cover_image)
    end
end
