# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.integer :staff_id,           null: false, default: "" # 職員ID
      t.string :encrypted_password, null: false, default: ""
      t.integer :role, null: false, default: 0 # 0=一般, 1=管理者

      t.timestamps null: false
    end

    add_index :users, :staff_id,            unique: true # 職員IDにユニークインデックスを追加
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
