class AddDirectionToUserFundingApplicationSubmissionVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :user_funding_application_submission_votes, :is_positive, :boolean
    add_column :user_funding_application_submission_votes, :is_negative, :boolean
  end
end
