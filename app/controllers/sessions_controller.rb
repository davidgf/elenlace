class SessionsController < ApplicationController
  before_action :set_wedding, only: [:new, :create]

  def new
  end

  def create
    user = WeddingUser.authenticate(@wedding.id, params[:password])
    if user
        cookies.permanent[:auth_token] = user.auth_token
        redirect_to root_url
    else
        flash.now.alert = "Invalid email or password"
        render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
        if params[:id] then
            @wedding = Wedding.find(params[:id])
        else
            @wedding = Wedding.first
        end
    end
end
