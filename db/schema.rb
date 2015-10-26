# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151026101721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "live",       default: false
  end

  create_table "areas_audiences", force: true do |t|
    t.integer "area_id"
    t.integer "audience_id"
  end

  create_table "audiences", force: true do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "care_home_metrics", force: true do |t|
    t.integer  "care_home_id",          null: false
    t.date     "collection_date"
    t.integer  "capacity"
    t.integer  "residential_vacancies"
    t.integer  "nursing_vacancies"
    t.integer  "short_stay_vacancies"
    t.date     "vacancy_update_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "care_home_metrics", ["care_home_id"], name: "index_care_home_metrics_on_care_home_id", using: :btree

  create_table "care_homes", force: true do |t|
    t.integer  "area_id",                                    null: false
    t.string   "cqc_location_uid",                           null: false
    t.text     "name",                                       null: false
    t.string   "town",                                       null: false
    t.string   "postcode",                                   null: false
    t.boolean  "nursing_care",               default: false, null: false
    t.boolean  "residential",                default: false, null: false
    t.boolean  "all_care",                   default: false, null: false
    t.boolean  "dementia_care",              default: false, null: false
    t.boolean  "learning_disabilities_care", default: false, null: false
    t.boolean  "mental_health_care",         default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "care_homes", ["area_id"], name: "index_care_homes_on_area_id", using: :btree
  add_index "care_homes", ["cqc_location_uid"], name: "index_care_homes_on_cqc_location_uid", unique: true, using: :btree

  create_table "centres", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.string   "status"
    t.text     "key_contacts"
    t.text     "assistant_contacts"
    t.text     "medical"
    t.integer  "medical_level"
    t.text     "equiptment"
    t.integer  "equiptment_level"
    t.text     "people"
    t.integer  "people_level"
    t.text     "food"
    t.integer  "food_level"
    t.text     "other"
  end

  create_table "condition_repeatables", force: true do |t|
    t.string   "name"
    t.integer  "condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "condition_repeatables", ["condition_id"], name: "index_condition_repeatables_on_condition_id", using: :btree

  create_table "conditions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "conditions_roles", force: true do |t|
    t.integer "role_id"
    t.integer "condition_id"
  end

  create_table "contributors", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributors", ["email"], name: "index_contributors_on_email", unique: true, using: :btree
  add_index "contributors", ["reset_password_token"], name: "index_contributors_on_reset_password_token", unique: true, using: :btree

  create_table "fund_verticals", force: true do |t|
    t.string   "title"
    t.integer  "council_spend"
    t.integer  "nhs_spend"
    t.integer  "trend"
    t.integer  "area_id"
    t.integer  "audience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs_roles", force: true do |t|
    t.integer "role_id"
    t.integer "job_id"
  end

  create_table "notices", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "population_metrics", force: true do |t|
    t.date     "date"
    t.integer  "count"
    t.string   "title"
    t.integer  "area_id"
    t.integer  "audience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "populations", force: true do |t|
    t.date     "date"
    t.string   "gender",      null: false
    t.integer  "count"
    t.integer  "audience_id"
    t.integer  "area_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "professions", force: true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "background"
    t.text     "project_description"
    t.string   "project_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_type"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "profession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "search_tags"
  end

  add_index "roles", ["profession_id"], name: "index_roles_on_profession_id", using: :btree

  create_table "suggestions", force: true do |t|
    t.string   "suggester"
    t.text     "description"
    t.text     "jobs"
    t.text     "sources"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggestions", ["role_id"], name: "index_suggestions_on_role_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
