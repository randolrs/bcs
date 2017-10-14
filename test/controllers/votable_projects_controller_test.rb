require 'test_helper'

class VotableProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @votable_project = votable_projects(:one)
  end

  test "should get index" do
    get votable_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_votable_project_url
    assert_response :success
  end

  test "should create votable_project" do
    assert_difference('VotableProject.count') do
      post votable_projects_url, params: { votable_project: { additional_information: @votable_project.additional_information, headline: @votable_project.headline, reason_selected: @votable_project.reason_selected, sub_headline: @votable_project.sub_headline } }
    end

    assert_redirected_to votable_project_url(VotableProject.last)
  end

  test "should show votable_project" do
    get votable_project_url(@votable_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_votable_project_url(@votable_project)
    assert_response :success
  end

  test "should update votable_project" do
    patch votable_project_url(@votable_project), params: { votable_project: { additional_information: @votable_project.additional_information, headline: @votable_project.headline, reason_selected: @votable_project.reason_selected, sub_headline: @votable_project.sub_headline } }
    assert_redirected_to votable_project_url(@votable_project)
  end

  test "should destroy votable_project" do
    assert_difference('VotableProject.count', -1) do
      delete votable_project_url(@votable_project)
    end

    assert_redirected_to votable_projects_url
  end
end
