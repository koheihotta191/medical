class NursingRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :nurse, class_name: 'User' # 記録を作成した看護師

  # バリデーション
  validates :date, :observations, :interventions, presence: true
end