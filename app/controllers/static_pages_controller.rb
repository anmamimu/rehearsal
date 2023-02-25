class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [:top, :terms_of_service, :privacy_policy]
  def top; end

  def terms_of_service; end

  def privacy_policy; end

  def selection_screen
  end

  def logged_in?
    !current_user.nil?
  end
end

