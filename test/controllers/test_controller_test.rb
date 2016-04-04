require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get a" do
    get :a
    assert_response :success
  end

end
