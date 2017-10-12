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
