class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.text :home_team
      t.integer :home_score
      t.text :away_team
      t.integer :away_score

      t.timestamps
    end
  end
end
