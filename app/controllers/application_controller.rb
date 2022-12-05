class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login 

  protected

  def not_authenticated
    flash[:info] = "ログインしてください"
    redirect_to main_app.login_url
  end
end
