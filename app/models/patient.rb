class Patient < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true # 担当医（ユーザー）

  # バリデーション
  validates :patient_code, presence: true, uniqueness: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth, :gender, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone_number, :emergency_contact_phone, format: { with: /\A\d{10,11}\z/ }, allow_blank: true

  # 性別の選択肢
  enum gender: { 男性: 0, 女性: 1, その他: 2 }

  # ステータスの選択肢
  enum status: { 外来: 0, 入院中: 1, 退院済み: 2 }
end