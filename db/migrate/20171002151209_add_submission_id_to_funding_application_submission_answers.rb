class AddSubmissionIdToFundingApplicationSubmissionAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_application_submission_answers, :funding_application_submission_id, :integer
  end
end
