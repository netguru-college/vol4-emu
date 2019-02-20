class AlterRoleColumnInParticipations < ActiveRecord::Migration[5.2]
  def up
    change_column :participations, :role, 'integer USING CAST(role AS integer)'
  end
  def down
    change_column :participations, :role, :string
  end
end
