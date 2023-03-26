# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by_email(params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, success: t('defaults.message.password_resets')
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    return unless @user.blank?

    not_authenticated
    nil
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: t('defaults.message.updated', item: 'パスワード')
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: 'パスワード')
      render :edit
    end
  end

  def deliver_reset_password_instructions!
    mail = false
    config = sorcery_config
    return false if config.reset_password_time_between_emails.present? && send(config.reset_password_email_sent_at_attribute_name) && send(config.reset_password_email_sent_at_attribute_name) > config.reset_password_time_between_emails.seconds.ago.utc

    self.class.sorcery_adapter.transaction do
      generate_reset_password_token!
      mail = send_reset_password_email! unless config.reset_password_mailer_disabled
    end
    mail
  end

  def load_from_reset_password_token(token, &block)
    load_from_token(
      token,
      @sorcery_config.reset_password_token_attribute_name,
      @sorcery_config.reset_password_token_expires_at_attribute_name,
      &block
    )
  end

  def change_password(new_password, raise_on_failure: false)
    clear_reset_password_token
    send(:"#{sorcery_config.password_attribute_name}=", new_password)
    sorcery_adapter.save raise_on_failure:
  end
end
