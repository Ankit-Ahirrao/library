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

  describe "check status" do
    it "determines whether status is valid" do
      ["approved", "pending", "not issued"].each do |stat| 
        book = build(:book, status: stat)
        expect(book).to be_valid
      end
    end

    it "checks invalid status" do  
      book = build(:book, status: "rejected")
      expect(book).not_to be_valid
    end
  end

  it "has a status approved" do 
    book = build(:book, status: "approved")
    expect(book).to be_approved
  end

  it "has a status approved" do 
    book = build(:book, status: "pending")
    expect(book).to be_pending
  end

  it "has a status approved" do 
    book = build(:book, status: "not issued")
    expect(book).to be_not_issued
  end
end
