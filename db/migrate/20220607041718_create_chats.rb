class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :application_token, null: false
      t.integer :chat_number, null: false
      t.integer :messages_count, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :chats, :applications, column: :application_token, primary_key: 'token'
    add_index :chats, %i[application_token chat_number], unique: true
  end
end
