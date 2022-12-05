class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :infometion, only: [:show, :edit, :update, :delete]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update!(user_params)
      redirect_to notes_path, success: t('defaults.message.updated', item: 'ユーザー情報')
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: 'ユーザー情報')
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, success: t('defaults.message.deleted', item: 'ユーザー情報')
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def infometion
    @user = current_user
  end
end
