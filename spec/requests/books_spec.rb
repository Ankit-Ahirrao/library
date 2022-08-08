require 'rails_helper'
require_relative '../support/devise'

RSpec.describe BooksController, type: :request do

  describe "GET /books" do
    it "has 200 as a response" do
      user = create(:user, is_admin: true)
      get books_path
      expect(response.status).to eq(200)
    end
  end
end