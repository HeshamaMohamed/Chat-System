require 'sidekiq-scheduler'

class UpdateChatsCountJob
  include Sidekiq::Worker

  def perform
    query = <<-SQL
      UPDATE applications
      SET chats_count = (
                          SELECT count(1)
                          FROM chats
                          WHERE chats.application_token = applications.token
                        )
    SQL
    ActiveRecord::Base.connection.execute(query)

    # Application.update_all('chats_count =
    #                                     ( SELECT count(1)
    #                                       FROM chats
    #                                       WHERE chats.application_token = applications.token)')
  end
end
