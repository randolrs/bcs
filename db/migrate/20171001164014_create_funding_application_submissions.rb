class CreateFundingApplicationSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_application_submissions do |t|
      t.integer :funding_application_id
      t.integer :user_id

      t.timestamps
    end
  end
end
