class FundingApplicationSubmissionAnswer < ApplicationRecord
  belongs_to :funding_application_submission, required: false
  belongs_to :funding_application_question, required: false
end
