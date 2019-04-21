class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :first_name
      t.text :last_name
      t.text :games_played
      t.integer :ppg
      t.integer :trb
      t.integer :apg
      t.integer :fgperc
      t.integer :threepperc
      t.integer :ftperc
      t.integer :efgperc
      t.integer :per
      t.integer :ws
      t.integer :team_id

      t.timestamps
    end
  end
end
