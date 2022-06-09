class CreateMessageJob < ApplicationJob
  queue_as :default

  def perform(application_token, chat_number, message_number, body)
    Message.create!(
      application_token: application_token,
      chat_number: chat_number,
      message_number: message_number,
      body: body
    )
  end
end
