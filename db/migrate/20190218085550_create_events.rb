class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :capacity
      t.datetime :started_at
      t.datetime :ended_at
      t.text :description

      t.timestamps
    end
  end
end
