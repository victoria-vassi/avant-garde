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

ActiveRecord::Schema.define(version: 2019_11_05_072937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "artist"
    t.string "title"
    t.string "year"
    t.integer "price"
    t.date "end_date"
    t.integer "minimum_investment"
    t.string "category"
    t.string "movement"
    t.string "technique"
    t.string "dimension"
    t.string "description_short"
    t.string "description_long"
    t.integer "value_increase_rate"
    t.integer "payout_rate"
    t.integer "funding_status"
    t.boolean "funded"
    t.bigint "seller_id"
    t.bigint "renter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["renter_id"], name: "index_campaigns_on_renter_id"
    t.index ["seller_id"], name: "index_campaigns_on_seller_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["campaign_id"], name: "index_images_on_campaign_id"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_investments_on_campaign_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "renters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "renters"
  add_foreign_key "campaigns", "sellers"
  add_foreign_key "images", "campaigns"
  add_foreign_key "investments", "campaigns"
  add_foreign_key "investments", "users"
end
