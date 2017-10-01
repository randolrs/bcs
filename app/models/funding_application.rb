class FundingApplication < ApplicationRecord
  has_many :funding_application_questions, dependent: :destroy
  accepts_nested_attributes_for :funding_application_questions, allow_destroy: true

end
