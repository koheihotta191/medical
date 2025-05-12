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

ActiveRecord::Schema[7.1].define(version: 2025_05_06_092018) do
  create_table "care_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "caregiver_id", null: false
    t.datetime "recorded_at", null: false
    t.string "meal_intake"
    t.string "toileting"
    t.string "mobility"
    t.string "sleep_condition"
    t.text "care_action"
    t.text "incident_report"
    t.text "note"
    t.float "body_temperature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caregiver_id"], name: "index_care_records_on_caregiver_id"
    t.index ["patient_id"], name: "index_care_records_on_patient_id"
  end

  create_table "medical_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "visited_at", null: false
    t.text "subjective"
    t.text "objective"
    t.text "assessment"
    t.text "plan"
    t.text "notes"
    t.string "diagnosis_code"
    t.date "follow_up_date"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_medical_records_on_doctor_id"
    t.index ["patient_id"], name: "index_medical_records_on_patient_id"
  end

  create_table "nursing_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "nurse_id", null: false
    t.datetime "recorded_at"
    t.text "observation"
    t.text "nursing_action"
    t.text "nursing_plan"
    t.text "evaluation"
    t.text "note"
    t.text "vital_signs"
    t.integer "pain_scale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nurse_id"], name: "index_nursing_records_on_nurse_id"
    t.index ["patient_id"], name: "index_nursing_records_on_patient_id"
  end

  create_table "patients", charset: "utf8mb3", force: :cascade do |t|
    t.string "patient_code", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "date_of_birth", null: false
    t.integer "gender", null: false
    t.string "blood_type"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.string "insurance_number"
    t.string "insurance_type"
    t.string "emergency_contact_name"
    t.string "emergency_contact_phone"
    t.text "memo"
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_code"], name: "index_patients_on_patient_code", unique: true
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone_number"
    t.integer "gender"
    t.string "position"
    t.string "department"
    t.integer "role", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.string "login_id"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "care_records", "patients"
  add_foreign_key "care_records", "users", column: "caregiver_id"
  add_foreign_key "medical_records", "patients"
  add_foreign_key "medical_records", "users", column: "doctor_id"
  add_foreign_key "nursing_records", "patients"
  add_foreign_key "nursing_records", "users", column: "nurse_id"
  add_foreign_key "patients", "users"
end
