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

ActiveRecord::Schema.define(version: 20140305035524) do

  create_table "spt_participants", force: true do |t|
    t.integer  "spt_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spts", force: true do |t|
    t.string   "tempat_tujuan"
    t.string   "durasi_waktu"
    t.string   "jenis_transportasi"
    t.text     "maksud_tugas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tugas", force: true do |t|
    t.string   "tempat_tujuan"
    t.string   "durasi_waktu"
    t.string   "jenis_transportasi"
    t.text     "maksud_tugas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nama_depan"
    t.string   "nama_belakang"
    t.string   "jabatan"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
