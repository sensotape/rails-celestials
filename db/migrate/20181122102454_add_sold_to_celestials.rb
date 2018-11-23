class AddSoldToCelestials < ActiveRecord::Migration[5.2]
  def change
    add_column :celestials, :sold, :boolean, null: false, default: false
  end
end
