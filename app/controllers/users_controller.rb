class UsersController < ApplicationController
  def login
    if user_signed_in?
      redirect_to root_path
    end
  end

  def signup
    if user_signed_in?
      redirect_to root_path
    end
  end

  def upvote_submission

    if user_signed_in? && params[:funding_application_submission_id]
      current_user.upvote_funding_application_submission(params[:funding_application_submission_id])
      flash[:notice] = "Thanks for Voting"
      redirect_to root_path
    else
      flash[:notice] = "You Must Login to Vote"
      redirect_to login_path
    end

  end

  def downvote_submission

    if user_signed_in? && params[:funding_application_submission_id]
      current_user.downvote_funding_application_submission(params[:funding_application_submission_id])
      flash[:notice] = "Thanks for Voting"
      redirect_to root_path
    else
      flash[:notice] = "You Must Login to Vote"
      redirect_to login_path
    end

  end


  def join_syndicate
    if user_signed_in?
      #need to add checks for syndicate existence
      if params[:syndicate_id]

        if Syndicate.where(:id => params[:syndicate_id]).exists?

          current_user.join_syndicate(params[:syndicate_id])
          flash[:notice] = "Successfully joined syndicate."
          redirect_to root_path
        else

          #syndicate doesnt exist in our db

          flash[:notice] = "That syndicate no longer exists."
        end

      else
        #no syndicate params
        flash[:notice] = "Something went wrong."
      end

    else
      #user not logged in
      flash[:notice] = " You must login to join a syndicate."
      redirect_to login_path
    end

  end
end
