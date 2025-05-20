require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do
  let(:user) { User.create!(login_id: "doctor1", email: "doc@example.com", password: "password", name: "医師", kana_name: "イシ", role: :doctor) }
  let(:patient) {
    Patient.create!(
      patient_code: "000001",
      last_name: "山田",
      first_name: "太郎",
      last_name_kana: "ヤマダ",
      first_name_kana: "タロウ",
      date_of_birth: "2000-01-01",
      gender: :男性
    )
  }

  it "必須項目があれば有効" do
    record = MedicalRecord.new(
      patient: patient,
      doctor: user,
      visited_at: Time.current,
      subjective: "主訴",
      objective: "所見",
      assessment: "評価",
      plan: "計画"
    )
    expect(record).to be_valid
  end

  it "visited_atがなければ無効" do
    record = MedicalRecord.new(
      patient: patient,
      doctor: user,
      subjective: "主訴",
      objective: "所見",
      assessment: "評価",
      plan: "計画"
    )
    expect(record).not_to be_valid
  end
end