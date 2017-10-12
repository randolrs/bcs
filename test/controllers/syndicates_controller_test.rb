require 'test_helper'

class SyndicatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @syndicate = syndicates(:one)
  end

  test "should get index" do
    get syndicates_url
    assert_response :success
  end

  test "should get new" do
    get new_syndicate_url
    assert_response :success
  end

  test "should create syndicate" do
    assert_difference('Syndicate.count') do
      post syndicates_url, params: { syndicate: { description: @syndicate.description, name: @syndicate.name } }
    end

    assert_redirected_to syndicate_url(Syndicate.last)
  end

  test "should show syndicate" do
    get syndicate_url(@syndicate)
    assert_response :success
  end

  test "should get edit" do
    get edit_syndicate_url(@syndicate)
    assert_response :success
  end

  test "should update syndicate" do
    patch syndicate_url(@syndicate), params: { syndicate: { description: @syndicate.description, name: @syndicate.name } }
    assert_redirected_to syndicate_url(@syndicate)
  end

  test "should destroy syndicate" do
    assert_difference('Syndicate.count', -1) do
      delete syndicate_url(@syndicate)
    end

    assert_redirected_to syndicates_url
  end
end
