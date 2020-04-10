# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_10_203609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "screenshots", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.uuid "website_id"
    t.string "diff_image_file_name"
    t.string "diff_image_content_type"
    t.integer "diff_image_file_size"
    t.datetime "diff_image_updated_at"
    t.decimal "diff_percent", precision: 7, scale: 5
    t.datetime "diff_date"
    t.index ["website_id"], name: "index_screenshots_on_website_id"
  end

  create_table "websites", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "diff_threshold", precision: 7, scale: 5, default: "5.0"
  end

end
