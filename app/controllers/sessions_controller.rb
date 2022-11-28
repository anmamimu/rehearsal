class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to notes_url, success: 'ログインしました'
    else
      flash[:danger] = 'ログイン失敗'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_url, notice: 'ログアウトしました')
  end
end