require "rails_helper"

RSpec.describe User, :type => :model do
  it "crear usuarios" do
    lindeman = User.create!(name: "Andy", last_name: "Lindeman", email: "linda@eman.com", password: "something")
    returned_used = User.find_by(email: "linda@eman.com")
    expect(returned_used.email).to eq(lindeman.email)
  end
end
