class CreateFundingApplicationSubmissionAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_application_submission_answers do |t|
      t.integer :funding_application_question_id
      t.text :answer_text
      t.decimal :answer_number
      t.boolean :answer_boolean

      t.timestamps
    end
  end
end
