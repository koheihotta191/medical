class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
    Rails.logger.debug "User staff_id: #{resource.staff_id}"

    if resource.staff_id.to_s == "123456"
      Rails.logger.debug "Redirecting to new_user_path"
      new_user_path  # 職員新規登録ページ
    else
      Rails.logger.debug "Redirecting to patients_path"
      patients_path  # 患者一覧ページ
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