class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


#USER STRIPE METHODS

   def stripe_customer_object

     if self.stripe_customer_id
       @stripe_customer = Stripe::Customer.retrieve(stripe_customer_id)
       return @stripe_customer
     else
       return nil
     end

   end


   def stripe_cards

    stripe_customer_object = self.stripe_customer_object

    if stripe_customer_object
      @stripe_cards = stripe_customer_object.sources.all(:limit => 5, :object => "card")
      return @stripe_cards
    else
      return nil
    end

  end


  def default_stripe_card_id

    stripe_customer_object = self.stripe_customer_object

    if stripe_customer_object

      return stripe_customer_object.default_source

    else
      
        return nil

    end

  end

#END USER STRIPE METHODS



end
