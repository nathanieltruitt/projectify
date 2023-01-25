class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :task_id
      t.integer :project_id
      t.timestamps
    end
  end
end
