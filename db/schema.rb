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

ActiveRecord::Schema.define(:version => 20121003004224) do

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "reference_person"
    t.date     "last_visit_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "address"
  end

  create_table "details", :force => true do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "sale_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "unit_price"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "job_title"
    t.date     "hire_date"
    t.date     "termination_date"
    t.decimal  "salary"
    t.string   "horary"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "expenses", :force => true do |t|
    t.string   "description"
    t.date     "date"
    t.decimal  "total"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "p_details", :force => true do |t|
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.integer  "product_id"
    t.integer  "purchase_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "product_types", :force => true do |t|
    t.string   "type_of_products"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "size"
    t.integer  "product_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "purchases", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "total"
    t.date     "date"
  end

  create_table "sales", :force => true do |t|
    t.date     "date"
    t.decimal  "total"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stocks", :force => true do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
