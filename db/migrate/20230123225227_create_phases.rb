class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.string :title
      t.integer :phase_number
      t.integer :project_id
      t.timestamps
    end
  end
end
