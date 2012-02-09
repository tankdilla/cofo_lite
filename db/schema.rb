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

ActiveRecord::Schema.define(:version => 20120209052153) do

  create_table "chord_definitions", :force => true do |t|
    t.integer  "chord_id"
    t.integer  "scale_number"
    t.string   "modifier"
    t.integer  "sort_order"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "chord_symbols", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chords", :force => true do |t|
    t.string   "name"
    t.string   "abbrev"
    t.string   "abbrev_2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "circle_steps", :force => true do |t|
    t.string   "note"
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "intervals", :force => true do |t|
    t.string   "name"
    t.integer  "half_step"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "measures", :force => true do |t|
    t.integer  "song_id"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mode_intervals", :force => true do |t|
    t.integer  "mode_id"
    t.integer  "interval_id"
    t.integer  "sort_order"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "modes", :force => true do |t|
    t.string   "name"
    t.string   "letter"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "note_types", :force => true do |t|
    t.string   "name"
    t.string   "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.string   "alt_name"
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "progression_steps", :force => true do |t|
    t.integer  "progression_id"
    t.integer  "chord_symbol_id"
    t.integer  "sort_order"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "progressions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.integer  "note_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "description"
    t.string   "tempo"
    t.string   "time_signature"
  end

end
