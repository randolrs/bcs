require 'test_helper'

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get choose" do
    get memberships_choose_url
    assert_response :success
  end

end
