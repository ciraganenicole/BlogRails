# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_05_112332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "authorId"
    t.integer "postId"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorId"], name: "index_comments_on_authorId"
    t.index ["postId"], name: "index_comments_on_postId"
  end

  create_table "like_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "authorId"
    t.integer "postId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorId"], name: "index_likes_on_authorId"
    t.index ["postId"], name: "index_likes_on_postId"
  end

  create_table "post_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "authorId"
    t.string "title"
    t.text "text"
    t.integer "commentsCounter"
    t.integer "likesCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorId"], name: "index_posts_on_authorId"
  end

  create_table "user_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.text "bio"
    t.integer "postsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts", column: "postId"
  add_foreign_key "comments", "users", column: "authorId"
  add_foreign_key "likes", "posts", column: "postId"
  add_foreign_key "likes", "users", column: "authorId"
  add_foreign_key "posts", "users", column: "authorId"
end
