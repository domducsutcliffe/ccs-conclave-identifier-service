class AddingPponIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :organisations, :ppon_id, unique: true
  end
end
