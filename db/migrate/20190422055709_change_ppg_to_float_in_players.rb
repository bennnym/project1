class ChangePpgToFloatInPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :ppg, :float
  end
end


