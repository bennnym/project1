class AddTeamIdToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :team_id, :integer
  end
end
