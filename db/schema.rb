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

ActiveRecord::Schema.define(version: 2020_02_27_201832) do

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

  create_table "comments", force: :cascade do |t|
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.index ["person_id"], name: "index_comments_on_person_id"
  end

  create_table "creations", force: :cascade do |t|
    t.integer "product_id"
    t.datetime "date"
    t.integer "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_creations_on_product_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "surname"
    t.string "completename"
    t.string "cedeusname"
    t.integer "proyecto"
    t.boolean "cedeus_check"
    t.boolean "brt_check"
    t.integer "ditl_check"
  end

  create_table "person_products", force: :cascade do |t|
    t.integer "person_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact"
    t.integer "rol"
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
    t.string "editorial"
    t.integer "tipocongreso"
    t.string "congreso"
    t.string "lugar"
    t.integer "numpart"
    t.integer "tipoorganizacion"
    t.string "institution"
    t.string "tipocolaboracion"
    t.string "estudiante"
    t.integer "genero"
    t.string "rut"
    t.integer "grado"
    t.string "inicio"
    t.string "termino"
    t.integer "etapa"
    t.integer "monto"
    t.integer "registro"
    t.integer "cluster_id"
    t.boolean "calles"
    t.boolean "cedeus_check"
    t.boolean "brt_check"
    t.boolean "ditl_check"
    t.string "otros_autores"
    t.boolean "cedeuscalles_check"
    t.index ["cluster_id"], name: "index_products_on_cluster_id"
  end

  create_table "respaldos", force: :cascade do |t|
    t.integer "product_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_respaldos_on_product_id"
  end

end
