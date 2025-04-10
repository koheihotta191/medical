class CreateMedicalRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_records do |t|
      t.date :date
      t.text :symptoms
      t.text :doctor_comment
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
