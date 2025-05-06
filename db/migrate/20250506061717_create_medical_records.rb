class CreateMedicalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_records do |t|
      t.references :patient, null: false, foreign_key: true                     # 患者
      t.references :doctor, null: false, foreign_key: { to_table: :users }     # 担当医（users テーブルの role: 1 に該当）

      t.datetime :visited_at, null: false                                       # 診察日時

      t.text :subjective                                                       # 主訴（S）
      t.text :objective                                                        # 他覚所見（O）
      t.text :assessment                                                       # 評価・診断（A）
      t.text :plan                                                             # 診療計画（P）
      t.text :notes                                                            # 備考・補足

      t.string :diagnosis_code                                                 # 病名コード（ICDなど）
      
      t.date :follow_up_date                                                   # 次回予約日
      t.string :attachment                                                     # 添付ファイル名（例：検査画像）

      t.timestamps
    end
  end
end
