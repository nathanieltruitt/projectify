class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :organization_id
      t.integer :contact_id
      t.integer :project_type_id
      t.integer :owner_id
      t.integer :status_id
      t.timestamp :start_date
      t.timestamp :end_date
      t.timestamps
    end
  end
end
