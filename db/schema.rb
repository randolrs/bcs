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

ActiveRecord::Schema.define(version: 20171014161828) do

  create_table "funding_application_questions", force: :cascade do |t|
    t.string   "question_text"
    t.string   "additional_text"
    t.string   "answer_format"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "funding_application_id"
  end

  create_table "funding_application_submission_answers", force: :cascade do |t|
    t.integer  "funding_application_question_id"
    t.text     "answer_text"
    t.decimal  "answer_number"
    t.boolean  "answer_boolean"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "funding_application_submission_id"
  end

  create_table "funding_application_submissions", force: :cascade do |t|
    t.integer  "funding_application_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "approved_for_interview"
    t.boolean  "rejected_for_interview"
    t.boolean  "approve_for_voting"
    t.boolean  "reject_for_voting"
  end

  create_table "funding_applications", force: :cascade do |t|
    t.string   "name"
    t.string   "url_slug"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "headline"
    t.text     "additional_information"
    t.integer  "syndicate_id"
  end

  create_table "installs", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "syndicate_users", force: :cascade do |t|
    t.integer  "syndicate_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "syndicates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_funding_application_submission_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "funding_application_submission_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "is_positive"
    t.boolean  "is_negative"
    t.integer  "votable_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "stripe_customer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "payment_active"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votable_projects", force: :cascade do |t|
    t.string   "headline"
    t.string   "sub_headline"
    t.text     "reason_selected"
    t.text     "additional_information"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "funding_application_submission_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "published"
    t.decimal  "raise_amount"
  end

end
