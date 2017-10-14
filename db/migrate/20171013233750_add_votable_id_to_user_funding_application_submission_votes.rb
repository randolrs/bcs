class AddVotableIdToUserFundingApplicationSubmissionVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :user_funding_application_submission_votes, :votable_project_id, :integer
  end
end
