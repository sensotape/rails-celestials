class ChangePriceToBeIntegerInCelestials < ActiveRecord::Migration[5.2]
  def change
    change_column :celestials, :price, :integer
  end
end
