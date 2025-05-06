class CareRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :caregiver, class_name: 'User' # 記録を作成した介護士

  # バリデーション
  validates :recorded_at, presence: true
  validates :meal_intake, :toileting, :mobility, :sleep_condition, length: { maximum: 255 }, allow_blank: true
  validates :body_temperature, numericality: { greater_than_or_equal_to: 35.0, less_than_or_equal_to: 42.0 }, allow_nil: true
end