class AddSyndicateIdToFundingApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_applications, :syndicate_id, :integer
  end
end
