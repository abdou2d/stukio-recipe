class SubscriptionsController < ApplicationController

  #before_filter :authenticate_user!

  def new
  end

  def create
  	# just for testing - change user to current_user
  	user = User.first

    #gets the credit card details submitted in the form
    token = params[:stripeToken]
    plan = params[:plan]

    #create a customer
    customer = Stripe::Customer.create(
      card: token,
      plan: 2,
      email: user.email
    )

    user.subscribed = "pro" #params[:plan]
    user.stripeid = customer.id
    user.save
    user.subscription.build(subs_params)

    render json: user

  end

  def update
  	# just for testing - change user to current_user
  	user = User.first
	
  	customer = Stripe::Customer.retrieve(user.stripeid)
  	subscription_id = customer.subscriptions.first.id
  	subscription = customer.subscriptions.retrieve(subscription_id)
  	subscription.plan = "2" # later change for params[:plan]
  	subscription.save

  	render json: subscription
  end

  def change_plan
  end


  private

  def subs_params
    params.require(:subscription).permit(:name, :subs_id, :price) 
  end

end