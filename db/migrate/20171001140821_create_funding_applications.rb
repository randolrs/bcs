class CreateFundingApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_applications do |t|
      t.string :name
      t.string :url_slug

      t.timestamps
    end
  end
end
