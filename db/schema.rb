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

ActiveRecord::Schema.define(version: 20160630214703) do

  create_table "location_logs", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "tenant_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "location_logs", ["manager_id"], name: "index_location_logs_on_manager_id"
  add_index "location_logs", ["tenant_id"], name: "index_location_logs_on_tenant_id"

  create_table "maintenance_conversations", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "maintenance_team_id"
    t.string   "maintenance_conversation_title"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "maintenance_conversations", ["maintenance_team_id"], name: "index_maintenance_conversations_on_maintenance_team_id"
  add_index "maintenance_conversations", ["tenant_id"], name: "index_maintenance_conversations_on_tenant_id"

  create_table "maintenance_requests", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "maintenance_team_id"
    t.text     "request_message"
    t.boolean  "request_open"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "maintenance_thread_id"
    t.integer  "manager_id"
  end

  add_index "maintenance_requests", ["maintenance_team_id"], name: "index_maintenance_requests_on_maintenance_team_id"
  add_index "maintenance_requests", ["maintenance_thread_id"], name: "index_maintenance_requests_on_maintenance_thread_id"
  add_index "maintenance_requests", ["manager_id"], name: "index_maintenance_requests_on_manager_id"
  add_index "maintenance_requests", ["tenant_id"], name: "index_maintenance_requests_on_tenant_id"

  create_table "maintenance_teams", force: :cascade do |t|
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "maintenance_teams", ["property_id"], name: "index_maintenance_teams_on_property_id"

  create_table "maintenance_threads", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "maintenance_team_id"
    t.string   "maintenance_thread_title"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "thread_open"
  end

  add_index "maintenance_threads", ["maintenance_team_id"], name: "index_maintenance_threads_on_maintenance_team_id"
  add_index "maintenance_threads", ["tenant_id"], name: "index_maintenance_threads_on_tenant_id"

  create_table "managers", force: :cascade do |t|
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
    t.integer  "property_id"
    t.integer  "maintenance_team_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true
  add_index "managers", ["maintenance_team_id"], name: "index_managers_on_maintenance_team_id"
  add_index "managers", ["property_id"], name: "index_managers_on_property_id"
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true

  create_table "properties", force: :cascade do |t|
    t.string   "property_name"
    t.string   "property_address"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "building_class"
    t.integer  "year_built"
    t.integer  "floor_count_building"
    t.integer  "unit_count_building"
    t.integer  "square_footage_building_total"
    t.text     "description"
    t.boolean  "cats_and_dogs_allowed"
    t.boolean  "elevator_building"
    t.boolean  "full_time_doorman"
    t.boolean  "concierge"
    t.boolean  "washer_dryer_in_unit"
    t.boolean  "laundry_in_building"
    t.boolean  "fitness_center"
    t.boolean  "swimming_pool"
    t.boolean  "parking_available"
    t.boolean  "common_area"
    t.boolean  "courtyard_building"
    t.boolean  "live_in_super"
    t.boolean  "storage_available"
    t.boolean  "bikeroom_in_building"
    t.boolean  "outdoor_space"
    t.boolean  "deck_building"
    t.boolean  "roof_deck_building"
    t.boolean  "terrace_building"
    t.integer  "manager_id"
    t.string   "property_type"
    t.boolean  "disability_accessible"
  end

  add_index "properties", ["manager_id"], name: "index_properties_on_manager_id"

  create_table "tenants", force: :cascade do |t|
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
    t.integer  "property_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true
  add_index "tenants", ["property_id"], name: "index_tenants_on_property_id"
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true

  create_table "units", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "tenant_id"
    t.integer  "manager_id"
    t.float    "total_rooms"
    t.integer  "bedrooms"
    t.float    "bathrooms"
    t.integer  "square_feet_unit"
    t.integer  "floors"
    t.boolean  "central_air_conditioning"
    t.boolean  "dishwasher"
    t.boolean  "loft"
    t.boolean  "storage_available"
    t.boolean  "cable_and_internet"
    t.boolean  "microwave"
    t.boolean  "fireplace"
    t.boolean  "pre_furnished"
    t.boolean  "disability_access"
    t.boolean  "deck"
    t.boolean  "roof_deck"
    t.boolean  "terrace"
    t.boolean  "balcony"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "units", ["manager_id"], name: "index_units_on_manager_id"
  add_index "units", ["property_id"], name: "index_units_on_property_id"
  add_index "units", ["tenant_id"], name: "index_units_on_tenant_id"

end
