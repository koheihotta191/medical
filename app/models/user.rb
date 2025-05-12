class User < ApplicationRecord
  # Deviseモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 認証に使用するキーをlogin_idに変更
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login_id = conditions.delete(:login_id)
    where(conditions).where(["login_id = :value", { value: login_id }]).first
  end

  # バリデーション
  validates :login_id, presence: true, uniqueness: true
end