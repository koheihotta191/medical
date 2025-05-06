class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def up
    change_table :users, bulk: true do |t|
      # 既存のカラムは追加しない
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
    end

    # インデックスを追加
    add_index :users, :reset_password_token, unique: true
  end

  def down
    change_table :users, bulk: true do |t|
      t.remove :reset_password_token, :reset_password_sent_at, :remember_created_at
    end
  end
end