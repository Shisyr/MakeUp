class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  def show
    @order_item = current_order.order_items.new
  end
  def edit
  end
  def update
    if(@product.update_attributes(product_params))
      redirect_to @product
    else
      render :edit
    end
  end
  def destroy
    @product.destroy
    redirect_to products_path
  end
  def new
    @product = Product.new(sub_category_id: params[:id])
  end
  def create
    @product = Product.new(product_params)
    if(@product.save)
      redirect_to @product
    else
      render "new"
    end
  end
  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :sub_category_id, :image)
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
