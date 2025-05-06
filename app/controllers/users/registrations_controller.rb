class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authorize_new_user_registration, only: [:new]
  before_action :configure_sign_up_params, only: [:create]

  private

  def authorize_new_user_registration
    authorize! :new, User
  end

  # Strong Parametersの設定
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :login_id, :name, :kana_name, :email, :phone_number, :gender, :position, :department, :password, :password_confirmation
    ])
  end
end