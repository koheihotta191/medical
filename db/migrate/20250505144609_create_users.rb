class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false # 職員の氏名
      t.string :kana_name, null: false # 氏名のカナ表記（検索用）
      t.string :email, null: false, default: "" # ログイン用メールアドレス（ユニーク）
      t.string :encrypted_password, null: false, default: "" # Devise用：暗号化されたパスワード
      t.string :phone_number # 連絡先電話番号（任意）
      t.integer :gender # 性別（0:男性, 1:女性, 2:その他）
      t.string :position # 役職名（例: 主任、部長など）
      t.string :department # 所属部署（例: 内科、外科、事務部など）
      t.integer :role, default: 0, null: false # 権限（0:管理者, 1:医師, 2:看護師, 3:薬剤師, 4:管理栄養士, 5:介護士, 6:医療事務）
      t.boolean :active, default: true, null: false # 有効／無効フラグ（退職・休職などの対応）
      t.string :login_id # 独自のログインID（メール以外の運用時）
      t.datetime :last_sign_in_at # 最後のログイン日時（Deviseで自動）

      t.timestamps
    end

    # emailカラムにユニークインデックスを追加
    add_index :users, :email, unique: true
    # login_idカラムにユニークインデックスを追加（必要に応じて）
    add_index :users, :login_id, unique: true
  end
end