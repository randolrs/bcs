class AccountsController < ApplicationController
  def settings
  end

  def edit_my_profile
  end

  def payments

    @stripe_cards = current_user.stripe_cards
    @default_source = current_user.default_stripe_card_id
    
  end
end
