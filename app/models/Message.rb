class Message < ApplicationRecord
  searchkick searchable: :body, # searches only in messages body.
             callbacks: :async,
             text_middle: [:body], # matches any part of the text
             deep_paging: true # show all results instead of paginating first 10,000

  after_commit :reindex

  validates :application_token, :chat_number, :body, presence: true

  belongs_to :chat, foreign_key: %i[application_token chat_number],
                    primary_key: %i[application_token chat_number]

  # def chat
  #   Chat.where('application_token = ? AND chat_number = ?', self.application_token, self.chat_number)
  # end
end
