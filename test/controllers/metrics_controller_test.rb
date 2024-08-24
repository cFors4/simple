require "test_helper"

class MetricsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get metrics_index_url
    assert_response :success
  end
end
