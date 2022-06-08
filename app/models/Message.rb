class Message < ApplicationRecord
  validates :application_token, :chat_number, :body, presence: true

  belongs_to :chat, foreign_key: %i[application_token chat_number],
                    primary_key: %i[application_token chat_number]

  # def chat
  #   Chat.where('application_token = ? AND chat_number = ?', self.application_token, self.chat_number)
  # end
end
