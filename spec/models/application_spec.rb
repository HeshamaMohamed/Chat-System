require 'spec_helper'

describe Application do
  # ActiveRecord matchers
  it { should have_db_column(:token) }
  it { should have_db_index(:token) }
  it { should have_db_column(:chats_count) }

  # ActiveModel matchers
  it { should validate_presence_of(:name) }
  it { should have_secure_token(:token) }
  it { should have_many(:chats) }
end
