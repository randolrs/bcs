class AddFundingApplicationIdToFundingApplicationQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_application_questions, :funding_application_id, :integer
  end
end
