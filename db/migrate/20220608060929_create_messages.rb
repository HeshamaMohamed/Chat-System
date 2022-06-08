class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.string :application_token, null: false
      t.integer :chat_number, null: false
      t.integer :message_number, null: false

      t.timestamps
    end

    add_index :messages, %i[application_token chat_number message_number], unique: true,
                      name: 'index_chats_on_application_token_chat_number_message_number'
  end
end
