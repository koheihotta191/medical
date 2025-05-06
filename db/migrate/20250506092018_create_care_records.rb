class CreateCareRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :care_records do |t|
      t.references :patient, null: false, foreign_key: true                              # 対象の利用者（患者）
      t.references :caregiver, null: false, foreign_key: { to_table: :users }           # 担当介護士（usersテーブル）

      t.datetime :recorded_at, null: false                                               # 記録日時

      t.string :meal_intake                                                              # 食事摂取状況
      t.string :toileting                                                                # 排泄状況
      t.string :mobility                                                                 # 移動状況
      t.string :sleep_condition                                                          # 睡眠状況

      t.text :care_action                                                                # 実施した介助内容
      t.text :incident_report                                                            # インシデント（転倒など）
      t.text :note                                                                       # 備考・自由記述

      t.float :body_temperature                                                          # 体温（簡易健康観察）

      t.timestamps
    end
  end
end
