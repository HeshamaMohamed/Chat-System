require 'spec_helper'

describe Message do
  # ActiveRecord matchers
  it { should have_db_column(:application_token) }
  it { should have_db_column(:chat_number) }
  it { should have_db_column(:message_number) }
  it { should have_db_column(:body) }
  it { should have_db_index(%i[application_token chat_number message_number]) }

  # ActiveModel matchers
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:application_token) }
  it { should validate_presence_of(:chat_number) }
  it { should validate_presence_of(:message_number) }
  it { should belong_to(:chat) }
end
