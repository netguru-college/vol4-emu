class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :contact
      t.date :day
      t.time :hour
    end
  end
end
