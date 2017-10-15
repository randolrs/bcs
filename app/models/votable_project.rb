class VotableProject < ApplicationRecord
  belongs_to :funding_application_submission, required: false
  has_many :user_funding_application_submission_votes

  def upvote_count
    upvotes = self.user_funding_application_submission_votes.where(:is_positive => true)

    if upvotes
      return upvotes.count
    else
      return 0
    end
  end

  def downvote_count
    downvotes = self.user_funding_application_submission_votes.where(:is_negative => true)

    if downvotes
      return downvotes.count
    else
      return 0
    end
  end


  def upvote_percentage
    all_votes = self.user_funding_application_submission_votes

    if all_votes.count > 0
      upvotes = self.upvote_count
      return (upvotes * 100 / all_votes.count)
    else
      return nil
    end
  end

  def downvote_percentage
    all_votes = self.user_funding_application_submission_votes
    if all_votes.count > 0
      downvotes = self.downvote_count
      return (downvotes * 100 / all_votes.count)
    else
      return nil
    end
  end

  def time_remaining
    seconds_remaining = (self.end_time - Time.now)
    if seconds_remaining > 0
      mm, ss = seconds_remaining.divmod(60)
      hh, mm = mm.divmod(60)
      dd, hh = hh.divmod(24)
      return "%d days, %dhr, %dmin" % [dd, hh, mm]
    else
      return "Ended on " + self.end_time.strftime("%A, %b %d")
    end
  end

end
