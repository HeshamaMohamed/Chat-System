class Application < ApplicationRecord
  has_secure_token
  validates :name, presence: true

  has_many :chats, foreign_key: :application_token, primary_key: :token
end
