require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get ditl" do
    get pages_ditl_url
    assert_response :success
  end

end
