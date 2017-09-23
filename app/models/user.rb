class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def stripe_cards

    if self.stripe_customer_id
      @stripe_cards = Stripe::Customer.retrieve(stripe_customer_id).sources.all(:limit => 5, :object => "card")
      return @stripe_cards
    else
      return nil
    end

  end

end
