class ChargesController < ApplicationController
  
  def new
  end
  
  def create
    # Amount in cents
    @amount = (current_order.subtotal * 100).to_i
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Shopper Order',
      currency: 'usd',
    })
    current_order.update_attributes(status: 'Completed')
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to order_items_path
  end
