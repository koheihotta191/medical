class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :first_name
      t.date :birth_date
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :emergency_contact
      t.string :medical_record_number

      t.timestamps
    end
    add_index :patients, :medical_record_number, unique: true
  end
end
