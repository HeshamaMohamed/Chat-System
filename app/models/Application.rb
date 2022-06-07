class Application < ApplicationRecord
  has_secure_token
  validates :name, presence: true

  has_many :chats
end
