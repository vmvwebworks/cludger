require "rails_helper"

RSpec.describe User, :type => :model do
  it "create users" do
    lindeman = User.create!(name: "Andy", last_name: "Lindeman", email: "linda@eman.com", password: "something")
    returned_used = User.find_by(email: "linda@eman.com")
    expect(returned_used.email).to eq(lindeman.email)
  end
end
RSpec.describe User, :type => :model do
  it "returns the request.env object" do
    post "users/auth/google_oauth2/callback.google_oauth2"
    puts request.env['omniauth.auth']
    #User.from_omniauth(request.env['omniauth.auth'])
  end
end
