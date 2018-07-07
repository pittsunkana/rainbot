ActiveRecord::Schema.define(version: 2018_07_07_061124) do
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "line_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
