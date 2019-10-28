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

ActiveRecord::Schema.define(version: 2019_10_28_062322) do

  create_table "cars", force: :cascade do |t|
    t.string "type"
    t.integer "number"
    t.integer "top_places"
    t.integer "bottom_places"
    t.integer "top_side_places"
    t.integer "bottom_side_places"
    t.integer "seat_places"
    t.integer "train_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["train_id"], name: "index_cars_on_train_id"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routes_railway_stations", force: :cascade do |t|
    t.integer "route_id"
    t.integer "railway_station_id"
    t.integer "railway_station_number"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "first_station"
    t.string "last_station"
    t.integer "user_id"
    t.integer "train_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "current_station_id"
    t.integer "route_id"
    t.boolean "cars_sort"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
