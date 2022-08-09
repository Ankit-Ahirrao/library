require 'rails_helper'

RSpec.describe BooksController, type: :request do

  describe "GET /books" do
    it "has 200 as a response" do
      #user = create(:user, is_admin: true)
      get books_path
      expect(response).to have_http_status(200)
    end
  end
  
end