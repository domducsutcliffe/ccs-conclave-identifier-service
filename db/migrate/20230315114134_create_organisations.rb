class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :ppon_id
      t.timestamps
    end
  end
end
