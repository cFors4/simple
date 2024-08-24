require "test_helper"

class StacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stacks_index_url
    assert_response :success
  end
end
