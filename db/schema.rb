# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_09_190958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_studies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traits", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_experiences", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "study_id"
    t.bigint "skill_id"
    t.string "company_name"
    t.string "status"
    t.string "contract_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_experiences_on_skill_id"
    t.index ["study_id"], name: "index_user_experiences_on_study_id"
    t.index ["user_profile_id"], name: "index_user_experiences_on_user_profile_id"
  end

  create_table "user_hobbies", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_profile_id"], name: "index_user_hobbies_on_user_profile_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "language_id"
    t.integer "proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_profile_id"], name: "index_user_languages_on_user_profile_id"
  end

  create_table "user_other_studies", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "other_study_id"
    t.string "study_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["other_study_id"], name: "index_user_other_studies_on_other_study_id"
    t.index ["user_profile_id"], name: "index_user_other_studies_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "last_name"
    t.datetime "birth_date"
    t.string "sex"
    t.integer "phone"
    t.string "residency_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "origin_country"
    t.string "residence_country"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "user_skills", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_profile_id"], name: "index_user_skills_on_user_profile_id"
  end

  create_table "user_studies", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "study_id"
    t.string "status"
    t.string "study_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_user_studies_on_study_id"
    t.index ["user_profile_id"], name: "index_user_studies_on_user_profile_id"
  end

  create_table "user_traits", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trait_id"], name: "index_user_traits_on_trait_id"
    t.index ["user_profile_id"], name: "index_user_traits_on_user_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_preferences", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "study_id"
    t.text "objectives"
    t.string "contract_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_work_preferences_on_study_id"
    t.index ["user_profile_id"], name: "index_work_preferences_on_user_profile_id"
  end

  add_foreign_key "user_experiences", "skills"
  add_foreign_key "user_experiences", "studies"
  add_foreign_key "user_experiences", "user_profiles"
  add_foreign_key "user_hobbies", "user_profiles"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "user_profiles"
  add_foreign_key "user_other_studies", "other_studies"
  add_foreign_key "user_other_studies", "user_profiles"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "user_profiles"
  add_foreign_key "user_studies", "studies"
  add_foreign_key "user_studies", "user_profiles"
  add_foreign_key "user_traits", "traits"
  add_foreign_key "user_traits", "user_profiles"
  add_foreign_key "work_preferences", "studies"
  add_foreign_key "work_preferences", "user_profiles"
end
