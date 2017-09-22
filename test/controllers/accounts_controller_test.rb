require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get settings" do
    get accounts_settings_url
    assert_response :success
  end

end
