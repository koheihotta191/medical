class CreateNursingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :nursing_records do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :nurse, null: false, foreign_key: true
      t.datetime :recorded_at
      t.text :observation
      t.text :nursing_action
      t.text :nursing_plan
      t.text :evaluation
      t.text :note
      t.text :vital_signs
      t.integer :pain_scale

      t.timestamps
    end
  end
end
