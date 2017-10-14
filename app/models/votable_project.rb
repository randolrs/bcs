class VotableProject < ApplicationRecord
  belongs_to :funding_application_submission, required: false
  has_many :user_funding_application_submission_votes
end
