class Admin::ProductsController < ApplicationController
  #before_action :authenticate_user!
  #before_action :require_authorized_for_current_product, only: [:new, :create, :destroy]

  
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to admin_products_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end
   
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  private

  #def require_authorized_for_current_product
  #  if current_product.user != current_user
  #    render plain: "unauthorized", status :unauthorized
  #  end
  # end


  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end


end
