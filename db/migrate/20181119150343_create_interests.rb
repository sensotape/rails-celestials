class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.references :celestial, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
