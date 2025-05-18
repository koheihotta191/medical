class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to patients_path, notice: "ユーザーを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def admin_only
  redirect_to patients_path, alert: "権限がありません" unless current_user&.admin?
  end

  def user_params
    params.require(:user).permit(:login_id, :name, :kana_name, :email, :phone_number, :gender, :position, :department, :role, :password, :password_confirmation)
  end
end