require 'sidekiq-scheduler'

class UpdateMessagesCountJob
  include Sidekiq::Worker

  def perform
    query = <<-SQL
      UPDATE chats
      SET messages_count =  (
                              SELECT count(1)
                              FROM messages
                              WHERE chats.application_token = messages.application_token
                                AND chats.chat_number       = messages.chat_number
                            )
    SQL
    ActiveRecord::Base.connection.execute(query)

    # Chat.update_all('messages_count =
    #                                     ( SELECT count(1)
    #                                       FROM messages
    #                                       WHERE messages.application_token = chats.application_token
    #                                         AND messages.chat_number = chats.chat_number)')
  end
end
