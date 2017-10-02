class FundingApplicationSubmission < ApplicationRecord
  belongs_to :funding_application, required: true
  belongs_to :user, required: false

  has_many :funding_application_submission_answers
  accepts_nested_attributes_for :funding_application_submission_answers, allow_destroy: true
end
