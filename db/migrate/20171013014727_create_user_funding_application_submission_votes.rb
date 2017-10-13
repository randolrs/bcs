class CreateUserFundingApplicationSubmissionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_funding_application_submission_votes do |t|
      t.integer :user_id
      t.integer :funding_application_submission_id

      t.timestamps
    end
  end
end
