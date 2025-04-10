class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "職員を登録しました。"
    else
      flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:staff_id, :password, :password_confirmation, :role)
  end

  def authorize_admin!
    unless current_user.staff_id == "123456"
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end