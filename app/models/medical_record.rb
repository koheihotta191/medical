class MedicalRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor, -> { where(role: 1) }, class_name: 'User'
  belongs_to :prescription, optional: true

  validates :visited_at, presence: true
  validates :subjective, :objective, :assessment, :plan, presence: true
end
