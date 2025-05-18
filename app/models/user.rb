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

  enum role: {
    admin: 0,          # 管理者
    doctor: 1,         # 医師
    nurse: 2,          # 看護師
    pharmacist: 3,     # 薬剤師
    dietitian: 4,      # 管理栄養士
    caregiver: 5,      # 介護士
    clerk: 6           # 医療事務
  }
end