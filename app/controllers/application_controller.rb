class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order
  def current_order
    current_user.orders.each do |order|
      if order.status == "cart"
        return @order = order
      end
    end
    if !@order
      return @order = current_user.orders.create(status: "cart")
    end
  end
  #before_action :current_cart

  #def current_cart
  #  @current_cart ||= ShoppingCart.new(token: cart_token)
  #end
  
  #helper_method :current_cart
  
  #private
#how does api work into this?
  #  def cart_token
  #    return @cart_token unless @cart_token.nil?

  #    session[:cart_token] ||= SecureRandom.hex(5)
  #    @cart_token = session[:cart_token]
  #  end
  
end
