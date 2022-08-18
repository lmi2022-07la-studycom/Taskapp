class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, limit: 255, null: false
      t.string :status
      t.datetime :deadline
      t.string :project_type

      t.timestamps
    end
  end
end
