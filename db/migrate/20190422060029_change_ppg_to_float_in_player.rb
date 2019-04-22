class ChangePpgToFloatInPlayer < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :trb, :float
    change_column :players, :apg, :float
    change_column :players, :fgperc, :float
    change_column :players, :threepperc, :float
    change_column :players, :ftperc, :float
    change_column :players, :efgperc, :float
    change_column :players, :per, :float
    change_column :players, :ws, :float

  end
end
