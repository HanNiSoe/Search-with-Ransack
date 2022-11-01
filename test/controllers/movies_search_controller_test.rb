require "test_helper"

class MoviesSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movies_search_index_url
    assert_response :success
  end
end
