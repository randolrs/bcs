class AddApproveforvotingToFundingApplciationSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_application_submissions, :approve_for_voting, :boolean
    add_column :funding_application_submissions, :reject_for_voting, :boolean
  end
end
