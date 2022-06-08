class Chat < ApplicationRecord
  validates :application_token, :chat_number, presence: true

  belongs_to :application, foreign_key: 'application_token', primary_key: 'token'

  has_many :messages, foreign_key: %i[application_token chat_number],
                      primary_key: %i[application_token chat_number],
                      dependent: :destroy

  # has_many :messages, lambda { |chat|
  #   unscope(where: :chat_id) # this to remove chat_id from query condition and to make our index a covering index.
  #     .where('messages.application_token = ? AND messages.chat_number = ?', chat.application_token, chat.chat_number)
  # }, dependent: :destroy
end
