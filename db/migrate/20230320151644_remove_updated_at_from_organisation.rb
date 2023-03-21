class RemoveUpdatedAtFromOrganisation < ActiveRecord::Migration[6.1]
  def change
    remove_column :organisations, :updated_at, :datetime
  end
end
