class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
