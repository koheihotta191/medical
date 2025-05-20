require 'rails_helper'

RSpec.describe User, type: :model do
  it "login_idがあれば有効" do
    user = User.new(login_id: "testuser", email: "test@example.com", password: "password", name: "テスト", kana_name: "テスト", role: :admin)
    expect(user).to be_valid
  end

  it "login_idがなければ無効" do
    user = User.new(email: "test@example.com", password: "password", name: "テスト", kana_name: "テスト", role: :admin)
    expect(user).not_to be_valid
  end

  it "roleはenumである" do
    user = User.new(login_id: "testuser", email: "test@example.com", password: "password", name: "テスト", kana_name: "テスト", role: :doctor)
    expect(user.role).to eq "doctor"
  end
end
