require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it "crear conversaciones" do
    conv = Conversation.create!(user_ids: ["fafaggwea", "hiuhguyguy"])
  end
end
