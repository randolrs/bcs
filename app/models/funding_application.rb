class FundingApplication < ApplicationRecord
  has_many :funding_application_questions, dependent: :destroy
  has_many :funding_application_submissions, dependent: :destroy
  belongs_to :syndicate, required: false
  accepts_nested_attributes_for :funding_application_questions, allow_destroy: true

end
