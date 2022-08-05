require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do 
    user1 = create(:user)
  end

  it "has valid attributes" do
    expect(user1).to be_valid
  end

  it "has a unique email address" do 
    user = build(:user, email: "ankit45@gmail.com")
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do 
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a name" do 
    user = build(:user, name: "")
    expect(user).to_not be_valid
  end

  it "is not valid without email" do 
    user = build(:user, email: "")
    expect(user).to_not be_valid
  end
end
