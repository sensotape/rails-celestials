class CreateCelestials < ActiveRecord::Migration[5.2]
  def change
    create_table :celestials do |t|
      t.float :price, null: false
      t.references :user, foreign_key: true
      t.string :category, null: false
      t.string :location, null: false
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
