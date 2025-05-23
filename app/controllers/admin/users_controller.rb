class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "職員を登録しました。"
    else
      render :new
    end
  end

  private
  
  def check_admin
    redirect_to root_path, alert: '管理者権限が必要です' unless current_user.role == 1
  end
  
  def user_params
    params.require(:user).permit(:staff_id, :password, :password_confirmation, :role)
  end

  
end
