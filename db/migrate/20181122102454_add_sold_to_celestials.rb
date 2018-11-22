class AddSoldToCelestials < ActiveRecord::Migration[5.2]
  def change
    add_column :celestials, :sold, :boolean, default: false
  end
end
