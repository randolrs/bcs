class FundingApplicationQuestion < ApplicationRecord
  belongs_to :funding_application
  has_many :funding_application_submission_answers
end
