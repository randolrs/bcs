require 'test_helper'

class FundingApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funding_application = funding_applications(:one)
  end

  test "should get index" do
    get funding_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_funding_application_url
    assert_response :success
  end

  test "should create funding_application" do
    assert_difference('FundingApplication.count') do
      post funding_applications_url, params: { funding_application: {  } }
    end

    assert_redirected_to funding_application_url(FundingApplication.last)
  end

  test "should show funding_application" do
    get funding_application_url(@funding_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_funding_application_url(@funding_application)
    assert_response :success
  end

  test "should update funding_application" do
    patch funding_application_url(@funding_application), params: { funding_application: {  } }
    assert_redirected_to funding_application_url(@funding_application)
  end

  test "should destroy funding_application" do
    assert_difference('FundingApplication.count', -1) do
      delete funding_application_url(@funding_application)
    end

    assert_redirected_to funding_applications_url
  end
end
