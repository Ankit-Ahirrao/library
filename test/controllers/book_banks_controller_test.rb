require "test_helper"

class BookBanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_banks_index_url
    assert_response :success
  end
end
