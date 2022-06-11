require 'spec_helper'

describe Chat do
  # ActiveRecord matchers
  it { should have_db_column(:application_token) }
  it { should have_db_column(:chat_number) }
  it { should have_db_column(:messages_count) }
  it { should have_db_index(%i[application_token chat_number]) }

  # ActiveModel matchers
  it { should validate_presence_of(:application_token) }
  it { should validate_presence_of(:chat_number) }
  it { should have_many(:messages) }
  it { should belong_to(:application) }
end
