class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:new, :create]

  def index
    authorize User # 権限チェック
    @users = User.all
  end

  def new
    authorize User # 権限チェック
    @user = User.new
  end

  def create
    authorize User # 権限チェック
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "ユーザーを作成しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :kana_name, :email, :phone_number, :gender, :position, :department, :role, :active, :login_id)
  end

  def authorize_admin!
    unless current_user.admin? # roleが0（管理者）の場合のみ許可
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end