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

ActiveRecord::Schema.define(version: 2021_03_23_002757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "email"
    t.text "demand_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sequence_definitions", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sequence_step_occurrences", force: :cascade do |t|
    t.datetime "sent_at"
    t.boolean "is_sent"
    t.bigint "sequence_step_id", null: false
    t.bigint "sequence_subscription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sequence_step_id"], name: "index_sequence_step_occurrences_on_sequence_step_id"
    t.index ["sequence_subscription_id", "sequence_step_id"], name: "user_sequence_step_subscription_idx", unique: true
    t.index ["sequence_subscription_id"], name: "index_sequence_step_occurrences_on_sequence_subscription_id"
  end

  create_table "sequence_steps", force: :cascade do |t|
    t.integer "wait"
    t.string "name"
    t.bigint "sequence_definition_id", null: false
    t.text "mail_content"
    t.string "mail_subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sequence_definition_id"], name: "index_sequence_steps_on_sequence_definition_id"
  end

  create_table "sequence_subscriptions", force: :cascade do |t|
    t.bigint "sequence_definition_id", null: false
    t.string "user_type", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sequence_definition_id"], name: "index_sequence_subscriptions_on_sequence_definition_id"
    t.index ["user_type", "user_id"], name: "index_sequence_subscriptions_on_user"
  end

  add_foreign_key "sequence_step_occurrences", "sequence_steps"
  add_foreign_key "sequence_step_occurrences", "sequence_subscriptions"
  add_foreign_key "sequence_steps", "sequence_definitions"
  add_foreign_key "sequence_subscriptions", "sequence_definitions"
end
