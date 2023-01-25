class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.integer :phase_id
      t.integer :collaborator_id
      t.integer :contact_id
      t.boolean :issue
      t.timestamps
    end
  end
end
