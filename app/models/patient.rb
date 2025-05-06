class Patient < ApplicationRecord
  # 担当医（ユーザー）との関連付け
  belongs_to :name, class_name: 'User', optional: true

  # バリデーション
  validates :patient_code, presence: true, uniqueness: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :date_of_birth, :gender, presence: true
  validates :gender, inclusion: { in: [0, 1, 2], message: "性別は0（男性）、1（女性）、2（その他）のいずれかを指定してください。" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end