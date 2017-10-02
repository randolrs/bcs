class AddApprovalToFundingApplicationSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_application_submissions, :approved_for_interview, :boolean
    add_column :funding_application_submissions, :rejected_for_interview, :boolean
  end
end
