class AccountsController < ApplicationController
  def settings
  end

  def edit_my_profile
  end

  def payments

    @stripe_cards = current_user.stripe_cards

    @default_source = current_user.default_stripe_card_object

  end

  def update_payment_information

    number = params[:cardNumber]
    exp_month = params[:expMonth]
    exp_year = params[:expYear]
    cvc = params[:cvc]

    token = Stripe::Token.create(
      :card => {
        :number => number,
        :exp_month => exp_month,
        :exp_year => exp_year,
        :cvc => cvc
      },
    )

    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)

    if customer

      card = customer.sources.create(source: token.id)
      customer.default_source = card.id
      customer.save

    end

    redirect_to edit_payment_methods_path


  end

end
