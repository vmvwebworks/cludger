require "rails_helper"

RSpec.describe User, :type => :model do
  it "crear usuarios" do
    User.create!(name: "Andy", last_name: "Lindeman", email: "linda@eman.com", password: "something", conversation_ids: ["fafgfageeqetq", "huihphgiygiu"])
  end
end
