class PagesController < ApplicationController

  before_action :require_user, except: [:landing, :info, :buy, :purchase]
  before_action :set_wedding, except: [:landing, :info, :buy, :purchase]

  def landing
    if current_attendee
      redirect_to home_path
    elsif current_user
      redirect_to admin_dashboard_path
    else
      render layout: false
    end
  end

  def info
    PurchaseMailer.info_mail(params).deliver
    respond_to do |format|
      format.html {render layout: false}
      format.json {render json: '{"ok": true}'}
    end
  end

  def buy
    render(layout: false)
  end

  def purchase
    respond_to do |format|
      if not blank_purchase_params
        PurchaseMailer.purchase_mail(params).deliver
        format.html { render layout: false }
      else
        flash[:notice] = "Por favor, rellena todos los campos"
        format.html { render action: 'buy', layout: false }
      end
    end
  end


  def home
    @resources = PublicActivity::Activity.where(owner_id: [@wedding.bride.id, @wedding.groom.id]).order("created_at desc").page(params[:page]).per_page(15)
    @message = Message.new
    respond_to do |format|
      format.html {
          if request.xhr?
            render partial: 'last_activity', locals: {resources: @resources}, layout: false
          end
        }
    end
  end

  def wedding
  end

  def events
  end

  def gallery
    if params[:order] == "votes"
      @pictures_urls = Picture.order(cached_votes_score: :desc).map {|p| p.image.url(:big)}
    else
      @pictures_urls = Picture.order(created_at: :desc).map {|p| p.image.url(:big)}
    end

    render layout: false
  end

private

    # Never trust parameters from the scary internet, only allow the white list through.
    def blank_purchase_params
      required_params = [:bride_name, :bride_surname, :groom_name, :groom_surname, :wedding_date, :email, :phone]
      required_params.each do |p|
        return true if params[p].blank?
      end
      return false
    end
end
