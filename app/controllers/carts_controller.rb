class CartsController < ApplicationController
  def show
    @products = Product.all
    @order_items = current_order.order_items
  end
end
