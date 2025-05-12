class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # ログイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
    patients_path # ログイン後に患者一覧ページにリダイレクト
  end

  # 権限エラー時の処理
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: "アクセス権限がありません。"
  end

  private

  def user_not_authorized
    flash[:alert] = "アクセス権限がありません。"
    redirect_to(request.referrer || root_path)
  end

  # Deviseで許可するパラメーターを設定
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in, keys: [:login_id])
    # 新規登録時のパラメータ許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana_name, :email, :phone_number, :gender, :position, :department, :role, :active, :login_id])

    # アカウント更新時のパラメータ許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :kana_name, :email, :phone_number, :gender, :position, :department, :role, :active, :login_id])
  end
end