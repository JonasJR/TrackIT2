require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

end
