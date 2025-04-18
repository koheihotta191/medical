# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_04_09_141548) do
  create_table "medical_records", charset: "utf8mb3", force: :cascade do |t|
    t.date "date"
    t.text "symptoms"
    t.text "doctor_comment"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medical_records_on_patient_id"
  end

  create_table "patients", charset: "utf8mb3", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.date "birth_date"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.string "emergency_contact"
    t.string "medical_record_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_record_number"], name: "index_patients_on_medical_record_number", unique: true
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "staff_id", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["staff_id"], name: "index_users_on_staff_id", unique: true
  end

  add_foreign_key "medical_records", "patients"
end
