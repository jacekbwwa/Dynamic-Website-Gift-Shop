require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get showOrderItems" do
    get orders_showOrderItems_url
    assert_response :success
  end

end
