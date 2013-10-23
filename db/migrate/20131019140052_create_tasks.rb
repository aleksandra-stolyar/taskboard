class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority
      t.boolean :is_done
      t.date :deadline
      t.references :project, index: true

      t.timestamps
    end
  end
end
