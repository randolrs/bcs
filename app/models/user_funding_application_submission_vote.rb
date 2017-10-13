class UserFundingApplicationSubmissionVote < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :funding_application_submissions, required: false
end
