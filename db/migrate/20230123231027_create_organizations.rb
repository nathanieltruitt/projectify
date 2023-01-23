class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :title
      t.text :description
      t.integer :primary_contact_id
      t.timestamps
    end
  end
end
