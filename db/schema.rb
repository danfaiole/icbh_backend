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

ActiveRecord::Schema.define(version: 20200210234247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_status", force: :cascade do |t|
    t.datetime "last_news"
    t.datetime "last_event"
    t.datetime "last_download"
    t.boolean  "form_avaliable"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "downloads", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "event_notifications", force: :cascade do |t|
    t.integer  "event_id",        null: false
    t.integer  "delayed_jobs_id"
    t.datetime "date",            null: false
    t.string   "title",           null: false
    t.string   "body",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["delayed_jobs_id"], name: "index_event_notifications_on_delayed_jobs_id", using: :btree
    t.index ["event_id"], name: "index_event_notifications_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_date",                   null: false
    t.datetime "end_date",                     null: false
    t.string   "title",                        null: false
    t.string   "color",       default: "blue", null: false
    t.string   "description"
    t.string   "location"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["end_date"], name: "index_events_on_end_date", using: :btree
    t.index ["start_date"], name: "index_events_on_start_date", using: :btree
  end

  create_table "form_data", force: :cascade do |t|
    t.integer  "form_id",    null: false
    t.jsonb    "data",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_data_on_form_id", using: :btree
  end

  create_table "form_notifications", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "delayed_jobs_id"
    t.datetime "date"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["delayed_jobs_id"], name: "index_form_notifications_on_delayed_jobs_id", using: :btree
    t.index ["form_id"], name: "index_form_notifications_on_form_id", using: :btree
  end

  create_table "forms", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "help_text"
    t.boolean  "active",     default: false, null: false
    t.jsonb    "fields"
    t.date     "start_date",                 null: false
    t.date     "end_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",                    null: false
    t.text     "body"
    t.string   "title_image_file_name"
    t.string   "title_image_content_type"
    t.integer  "title_image_file_size"
    t.datetime "title_image_updated_at"
    t.boolean  "published"
    t.date     "publication_date"
    t.integer  "user_id",                  null: false
    t.string   "tags"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "news_notifications", force: :cascade do |t|
    t.integer  "news_id"
    t.integer  "delayed_jobs_id"
    t.datetime "date"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["delayed_jobs_id"], name: "index_news_notifications_on_delayed_jobs_id", using: :btree
    t.index ["news_id"], name: "index_news_notifications_on_news_id", using: :btree
  end

  create_table "notification_news", force: :cascade do |t|
    t.integer  "news_id",         null: false
    t.integer  "delayed_jobs_id"
    t.datetime "date",            null: false
    t.string   "title",           null: false
    t.string   "body",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["delayed_jobs_id"], name: "index_notification_news_on_delayed_jobs_id", using: :btree
    t.index ["news_id"], name: "index_notification_news_on_news_id", using: :btree
  end

  create_table "registered_phones", force: :cascade do |t|
    t.string   "phone_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_id"], name: "index_registered_phones_on_phone_id", using: :btree
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections",             default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type",                                null: false
    t.string   "auth_key"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string   "device_token", limit: 64, null: false
    t.datetime "failed_at",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "app_id"
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token", using: :btree
  end

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer  "badge"
    t.string   "device_token",      limit: 64
    t.string   "sound"
    t.text     "alert"
    t.text     "data"
    t.integer  "expiry",                       default: 86400
    t.boolean  "delivered",                    default: false, null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                       default: false, null: false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.text     "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "alert_is_json",                default: false
    t.string   "type",                                         null: false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",             default: false, null: false
    t.text     "registration_ids"
    t.integer  "app_id",                                       null: false
    t.integer  "retries",                      default: 0
    t.string   "uri"
    t.datetime "fail_after"
    t.boolean  "processing",                   default: false, null: false
    t.integer  "priority"
    t.text     "url_args"
    t.string   "category"
    t.boolean  "content_available",            default: false
    t.text     "notification"
    t.boolean  "mutable_content",              default: false
    t.index ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "url",                                    null: false
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string   "title",                                  null: false
    t.string   "description"
    t.boolean  "published",              default: false
    t.date     "publication_date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_foreign_key "event_notifications", "delayed_jobs", column: "delayed_jobs_id"
  add_foreign_key "event_notifications", "events"
  add_foreign_key "form_data", "forms"
  add_foreign_key "form_notifications", "delayed_jobs", column: "delayed_jobs_id"
  add_foreign_key "form_notifications", "forms"
  add_foreign_key "news", "users"
  add_foreign_key "news_notifications", "delayed_jobs", column: "delayed_jobs_id"
  add_foreign_key "news_notifications", "news"
  add_foreign_key "notification_news", "delayed_jobs", column: "delayed_jobs_id"
  add_foreign_key "notification_news", "news"
end
