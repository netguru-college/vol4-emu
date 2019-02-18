class AddIconToSport < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :icon, :string
  end
end
