require "test_helper"

class BookCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_collections_index_url
    assert_response :success
  end
end