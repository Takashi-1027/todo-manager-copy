class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :details
      t.integer :priority, null: false, default: 0
      t.datetime :remind_at
      t.date :start_date
      t.date :end_date
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
