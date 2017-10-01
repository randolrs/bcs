class CreateFundingApplicationQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_application_questions do |t|
      t.string :question_text
      t.string :additional_text
      t.string :answer_format

      t.timestamps
    end
  end
end
