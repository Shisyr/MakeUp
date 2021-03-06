class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end
  def edit
  end
  def update
    if(@category.update_attributes(category_params))
      redirect_to @category
    else
      render "edit"
    end
  end
  def destroy
    @category.destroy
    redirect_to categories_path
  end
  def show
    @sub_categories = @category.sub_categories
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if(@category.save)
      redirect_to @category
    else
      render :new
    end
  end
  private
  def category_params
    params.require(:category).permit(:title, :active)
  end
  def set_category
    @category = Category.find(params[:id])
  end
end
