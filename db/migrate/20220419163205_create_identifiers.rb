class CreateIdentifiers < ActiveRecord::Migration[6.0]
  def change
    # drop_table :identifiers
    create_table :identifiers do |t|
      t.string :ccs_id
      t.string :id_type
      t.boolean :ccs_persisted

      t.timestamps
    end
    add_index :identifiers, :ccs_id, unique: true
  end
end
