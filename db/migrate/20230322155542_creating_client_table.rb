class CreatingClientTable < ActiveRecord::Migration[6.1]
  def change
    create_table "clients", id: :serial, force: :cascade do |t|
      t.string "name"
      t.text "description"
      t.string "api_key", limit: 255
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
