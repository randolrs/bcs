class MembershipsController < ApplicationController
  def choose
  end

  def checkout

  end

  def complete_checkout

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

    customer = Stripe::Customer.create(
      :description => "Customer for BCS",
      :source => token.id
    )

    current_user.update(:stripe_customer_id => customer.id)

    Stripe::Subscription.create(
      :customer => customer.id,
      :items => [
        {
          :plan => "basic",
        },
      ]
    )

    redirect_to root_path
  end

end
