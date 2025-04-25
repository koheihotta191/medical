class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
    if resource.admin?  # admin role を持っている場合
      root_path  # 管理者用の職員登録ページにリダイレクト
    else
      patients_path  # 一般職員の場合は患者一覧ページにリダイレクト
    end
  end

  # 権限エラー時の処理
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: "アクセス権限がありません。"
  end

  private

  # Deviseで許可するパラメーターを設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:staff_id, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:staff_id])
  end
end