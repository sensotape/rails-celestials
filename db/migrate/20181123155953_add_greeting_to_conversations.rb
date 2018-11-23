class AddGreetingToConversations < ActiveRecord::Migration[5.2]
  MESSAGE = "Greetings, earthling.\n I am desperate to buy your sexy celestial.\n Let's chat?"

  def change
    add_column :conversations, :greeting, :text, default: MESSAGE
    change_column_default( :messages, :body, nil )
  end
end
