class Subscription < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :product_id
  validates_presence_of :email
  
  attr_accessor :stripe_card_token
  attr_accessor :amount

  
  def save_with_payment
    if valid?

      #customer = Stripe::Customer.create(email: email, description: product_id,  :card => stripe_card_token)
      #puts "+++++++++++++#{stripe_card_token}" 

      #puts "+++++++++++++#{customer.inspect}" 
      #puts "+++++++++++++#{customer.id}"  

      response = Stripe::Charge.create({:amount => (amount.to_i)*100,:currency => "usd", :description => "product_id",:source => stripe_card_token})
      puts "+++++++++++++#{response.inspect}" 

     # self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
