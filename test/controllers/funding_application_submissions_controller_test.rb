require 'test_helper'

class FundingApplicationSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funding_application_submission = funding_application_submissions(:one)
  end

  test "should get index" do
    get funding_application_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_funding_application_submission_url
    assert_response :success
  end

  test "should create funding_application_submission" do
    assert_difference('FundingApplicationSubmission.count') do
      post funding_application_submissions_url, params: { funding_application_submission: {  } }
    end

    assert_redirected_to funding_application_submission_url(FundingApplicationSubmission.last)
  end

  test "should show funding_application_submission" do
    get funding_application_submission_url(@funding_application_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_funding_application_submission_url(@funding_application_submission)
    assert_response :success
  end

  test "should update funding_application_submission" do
    patch funding_application_submission_url(@funding_application_submission), params: { funding_application_submission: {  } }
    assert_redirected_to funding_application_submission_url(@funding_application_submission)
  end

  test "should destroy funding_application_submission" do
    assert_difference('FundingApplicationSubmission.count', -1) do
      delete funding_application_submission_url(@funding_application_submission)
    end

    assert_redirected_to funding_application_submissions_url
  end
end
