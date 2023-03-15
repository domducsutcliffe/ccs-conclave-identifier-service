class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.bigint :ORG_ID
      t.string :PPON_ID
      t.timestamps
    end
  end
end
