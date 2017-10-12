class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image,
    :styles => { :medium => "400x400#", :small => "70x70#", :thumb => "30x30#"},
    :default_url => 'missing_person_photo.png',
    :s3_protocol => :https

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :funding_application_submissions


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


  def default_stripe_card_object

    stripe_customer_object = self.stripe_customer_object

    if stripe_customer_object

      card = stripe_customer_object.sources.retrieve(stripe_customer_object.default_source)

      if card
        return card
      else
        return nil
      end

    else

        return nil

    end

  end

#END USER STRIPE METHODS

  def join_syndicate(syndicate_id)

    if Syndicate.where(:id => syndicate_id).exists?
      unless SyndicateUser.where(:user_id => self.id, :syndicate_id => syndicate_id)
        SyndicateUser.create(:syndicate_id => syndicate_id, :user_id => self.id)
        return
      else

        return
      end
    end

  end


  def votable_funding_application_submissions

    return FundingApplicationSubmission.all.where(:approved_for_interview => nil, :rejected_for_interview => nil)
    #return FundingApplicationSubmission.where(:status_pending => true)

  end


end
