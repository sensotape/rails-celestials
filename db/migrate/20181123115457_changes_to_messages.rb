class ChangesToMessages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :messages, :interest
    add_reference :messages, :conversation
    add_reference :messages, :user
    add_column :messages, :read, :boolean, null: false, default: false
  end
end
