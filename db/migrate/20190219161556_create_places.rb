class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.string :owner
      t.string :phone_number

      t.timestamps
    end
  end
end
