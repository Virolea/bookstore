require "rails_helper"

describe Book do
  it "has a valid Factory" do
    expect(build(:user)).to be_valid
  end

  it "allows only unique usernames" do
    user1 = create(:user, username: "JohnDoe")
    user2 = build(:user, username: "JohnDoe")
    user2.valid?
    expect(user2.errors[:username]).to include("has already been taken")
  end
end
