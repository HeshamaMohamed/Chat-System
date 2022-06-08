class Chat < ApplicationRecord
  validates :application_token, :chat_number, presence: true

  belongs_to :application, foreign_key: 'application_token', primary_key: 'token'
  has_many :messages, dependent: :destroy
end
