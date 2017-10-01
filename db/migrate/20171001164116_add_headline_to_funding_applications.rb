class AddHeadlineToFundingApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_applications, :headline, :string
    add_column :funding_applications, :additional_information, :text
  end
end
