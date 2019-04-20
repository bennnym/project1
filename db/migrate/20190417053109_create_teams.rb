class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :conference  
      t.string :division
      t.string :founded
      t.string :arena
      t.string :location
      t.string :colors
      t.string :general_manager
      t.string :president
      t.string :headcoach
      t.string :championships
      t.text   :team_url
      t.text   :logo
    end
  end
end
