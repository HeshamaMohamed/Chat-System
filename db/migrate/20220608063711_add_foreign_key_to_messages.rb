class AddForeignKeyToMessages < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    ALTER TABLE messages
    ADD FOREIGN KEY (application_token, chat_number)
    REFERENCES chats(application_token, chat_number)
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE messages
    ADD FOREIGN KEY (application_token, chat_number)
    REFERENCES chats(application_token, chat_number)
    SQL
  end
end
