class Patient < ApplicationRecord
  has_many :medical_records, dependent: :destroy
end
