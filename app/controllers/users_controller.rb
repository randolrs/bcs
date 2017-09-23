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
end
