class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :organization_id, :integer
    add_column :users, :permission_id, :integer
  end
end
