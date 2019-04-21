class AddTeamIdToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :team_id, :integer
  end
end
