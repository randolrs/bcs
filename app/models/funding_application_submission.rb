class FundingApplicationSubmission < ApplicationRecord
  belongs_to :funding_application, required: true
  belongs_to :user, required: false

  has_many :funding_application_submission_answers
  accepts_nested_attributes_for :funding_application_submission_answers, allow_destroy: true

  def approve_for_interview

    self.update(:approved_for_interview => true)

  end

  def reject_for_interview

    self.update(:rejected_for_interview => true)

  end
  
  def status_pending

    if (self.approved_for_interview or self.rejected_for_interview)
      return true
    else
      return false
    end

  end


end
