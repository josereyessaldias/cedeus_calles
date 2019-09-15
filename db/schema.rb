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

ActiveRecord::Schema.define(version: 2019_09_15_210756) do

  create_table "cluster_people", force: :cascade do |t|
    t.integer "person_id"
    t.integer "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_cluster_people_on_cluster_id"
    t.index ["person_id"], name: "index_cluster_people_on_person_id"
  end

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_products", force: :cascade do |t|
    t.integer "person_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_products_on_person_id"
    t.index ["product_id"], name: "index_person_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "titulo"
    t.integer "tipo"
    t.string "revista"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doi"
    t.string "volume"
    t.string "pages"
    t.boolean "partresearchers"
    t.boolean "partpostdoc"
    t.boolean "partundergrad"
    t.boolean "partgrad"
    t.integer "fundfondap"
    t.integer "fundfondecyt"
    t.integer "fundfondef"
    t.integer "fundbasal"
    t.integer "fundicm"
    t.integer "fundother"
    t.string "fundspecify"
    t.string "indexacion"
    t.string "editores"
    t.string "editorial"
  end

end
