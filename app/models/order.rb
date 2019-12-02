class Order < ApplicationRecord

    has_many :items, class_name: 'OrderItem'
    belongs_to :user

    def create
         # Amount in cents
    @amount = (current_product.price * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Chestnut Feather Browbands',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
