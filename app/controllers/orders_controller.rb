class OrdersController < ApplicationController

  def new
  end

  def create
  end

   def add_item
    product_id = params[:product_id]
    quantity = params[:quantity]
    product = Product.find(product_id)
    order_item = current_order.items.find_or_create_by(product_id: product_id, quantity: quantity, order_id: current_order.id)
    redirect_to cart_path
  end

  private

  def update_subtotal(product, quantity)
    price = product.price * quantity.to_i
    if current_order.subtotal
      current_subtotal = current_order.subtotal + price
      current_order.update_attributes(subtotal: current_subtotal)
    end
    current_order.update_attributes(subtotal: price)
  end
  

  def order_params
    params.require(:order).permit(:user_id, :status, :subtotal)
  end
end