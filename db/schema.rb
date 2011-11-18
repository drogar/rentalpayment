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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111115003703) do

  create_table "people", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "apartment_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "province_or_state"
    t.string   "country"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "salutation_id"
  end

  create_table "salutations", :force => true do |t|
    t.string   "salutation"
    t.string   "language"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
