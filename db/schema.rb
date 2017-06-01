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

ActiveRecord::Schema.define(version: 20170601101110) do

  create_table "image_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "image_posts_id"
    t.index ["image_posts_id"], name: "index_image_comments_on_image_posts_id"
    t.index ["user_id"], name: "index_image_comments_on_user_id"
  end

  create_table "image_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "image_posts_id"
    t.index ["image_posts_id"], name: "index_image_likes_on_image_posts_id"
    t.index ["user_id"], name: "index_image_likes_on_user_id"
  end

  create_table "image_paths", force: :cascade do |t|
    t.string   "path"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "image_posts_id"
    t.index ["image_posts_id"], name: "index_image_paths_on_image_posts_id"
  end

  create_table "image_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_image_posts_on_user_id"
  end

  create_table "imagecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "imagepost_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["imagepost_id"], name: "index_imagecomments_on_imagepost_id"
    t.index ["user_id"], name: "index_imagecomments_on_user_id"
  end

  create_table "imagepaths", force: :cascade do |t|
    t.string   "path"
    t.integer  "imagepost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["imagepost_id"], name: "index_imagepaths_on_imagepost_id"
  end

  create_table "imageposts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_imageposts_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.boolean  "completed"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "jk"
    t.string   "username"
    t.string   "profilepic"
    t.date     "birthdate"
    t.float    "weight"
    t.float    "height"
    t.string   "password_digest"
  end

end
