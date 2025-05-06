class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :patient_code, null: false                    # 病院独自の患者ID
      t.string :last_name, null: false                       # 姓
      t.string :first_name, null: false                      # 名
      t.string :last_name_kana, null: false                  # 姓（カナ）
      t.string :first_name_kana, null: false                 # 名（カナ）
      t.date :date_of_birth, null: false                     # 生年月日
      t.integer :gender, null: false                         # 性別
      t.string :blood_type                                   # 血液型
      t.string :postal_code                                  # 郵便番号
      t.string :address                                      # 住所
      t.string :phone_number                                 # 電話番号
      t.string :email                                        # メール
      t.string :insurance_number                             # 保険証番号
      t.string :insurance_type                               # 保険の種類
      t.string :emergency_contact_name                       # 緊急連絡先氏名
      t.string :emergency_contact_phone                      # 緊急連絡先電話番号
      t.text :memo                                            # 特記事項・備考
      t.integer :status, default: 0, null: false             # ステータス
      t.references :name, foreign_key: { to_table: :users } # 担当医

      t.timestamps
    end

    # patient_code にユニークインデックスを追加（ここが正解）
    add_index :patients, :patient_code, unique: true
  end
end
