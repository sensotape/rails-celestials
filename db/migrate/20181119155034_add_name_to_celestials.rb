class AddNameToCelestials < ActiveRecord::Migration[5.2]
  def change
    add_column :celestials, :name, :string, null: false
  end
end
