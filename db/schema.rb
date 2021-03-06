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

ActiveRecord::Schema.define(version: 2021_12_12_204303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friday_hosts", force: :cascade do |t|
    t.string "domain"
    t.string "token"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friday_projects", force: :cascade do |t|
    t.string "name"
    t.string "directory"
    t.string "package_manager"
    t.string "language_version"
    t.bigint "repository_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repository_id"], name: "index_friday_projects_on_repository_id"
  end

  create_table "friday_repositories", force: :cascade do |t|
    t.string "full_path"
    t.bigint "host_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["host_id"], name: "index_friday_repositories_on_host_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "domain"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

  create_table "libraries", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.string "full_path"
    t.string "directory"
    t.string "ruby_version"
    t.jsonb "dependencies"
    t.string "repoable_type"
    t.bigint "repoable_id"
    t.bigint "host_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["host_id"], name: "index_repos_on_host_id"
    t.index ["repoable_type", "repoable_id"], name: "index_repos_on_repoable"
  end

  add_foreign_key "friday_projects", "friday_repositories", column: "repository_id"
  add_foreign_key "friday_repositories", "friday_hosts", column: "host_id"
end
