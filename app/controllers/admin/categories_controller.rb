class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => 'Jungle', :password => 'book'

  def index
    @categories = Category.joins("LEFT JOIN products ON products.category_id = categories.id")
    .select('categories.name, count(products.*)').group('categories.id')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
