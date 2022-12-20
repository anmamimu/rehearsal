class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :guest_login]

  def index
    @user = User.new
  end

  def new; end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to notes_url, success: 'ログインしました'
    else
      flash[:danger] = 'ログイン失敗'
      render :new
    end
  end

  def guest_login
    @guest_user = User.create(
    email: SecureRandom.alphanumeric(10) + "@email.com",
    password: 'password',
    role: 'general'
    )
    auto_login(@guest_user)
    redirect_to notes_url, success: 'ゲストとしてログインしました'
  end

  def destroy
    logout
    redirect_to(root_url, success: 'ログアウトしました')
  end
end