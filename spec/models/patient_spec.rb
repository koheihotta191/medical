require 'rails_helper'

RSpec.describe Patient, type: :model do
  it "必須項目があれば有効" do
    patient = Patient.new(
      patient_code: "000001",
      last_name: "山田",
      first_name: "太郎",
      last_name_kana: "ヤマダ",
      first_name_kana: "タロウ",
      date_of_birth: "2000-01-01",
      gender: :男性
    )
    expect(patient).to be_valid
  end

  it "patient_codeがなければ無効" do
    patient = Patient.new(last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", date_of_birth: "2000-01-01", gender: :男性)
    expect(patient).not_to be_valid
  end
end