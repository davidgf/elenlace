class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :require_admin_user

  def index
  end
end
