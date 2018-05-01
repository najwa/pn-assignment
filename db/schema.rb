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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "wp_fitpro_directory", force: :cascade do |t|
    t.bigint "userid"
    t.string "source", limit: 80
    t.string "fullname", limit: 255
    t.string "businessname", limit: 255
    t.string "address1", limit: 255
    t.string "address2", limit: 255
    t.string "city", limit: 255
    t.string "province", limit: 255
    t.string "postalcode", limit: 255
    t.string "country", limit: 255
    t.string "email", limit: 255
    t.string "businessphone", limit: 255
    t.string "mobilephone", limit: 255
    t.string "url", limit: 255
    t.text "specialty"
    t.bigint "show_in_directory", default: 0
    t.bigint "level1_status", default: 0
    t.bigint "level2_status", default: 0
    t.bigint "procoach_status", default: 0
    t.integer "url_last_checked"
    t.integer "url_last_status", limit: 2
  end

end
