require "test_helper"

class ImagePageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get image_page_index_url
    assert_response :success
  end
end
