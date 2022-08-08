require 'rails_helper'

RSpec.describe Book, type: :model do

  it "is not a valid without title" do
    title = build(:book, title: "")
    expect(title).to_not be_valid
  end

  it "is not a valid without author" do
    author = build(:book, author: "")
    expect(author).to_not be_valid
  end

  it "is not a valid without description" do
    description = build(:book, description: "")
    expect(description).to_not be_valid
  end
end
