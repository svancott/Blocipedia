class ChargesController < ApplicationController
  # after_initialize { current_user.role = :premium }
  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   @amount = 1500

   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   current_user.update_attributes!(role: 'premium')
   flash[:notice] = "Congratulations on updrading to a premium membership, #{current_user.email}!"
   redirect_to wikis_path # or wherever

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: @amount
   }
 end
end
