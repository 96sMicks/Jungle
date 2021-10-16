class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => 'Jungle', :password => 'book'

  def index
    @categories = Category.joins("LEFT JOIN products ON products.category_id = categories.id")
    .select('categories.name, count(products.*)').group('categories.id')
  end

  def show
  end

  def create
  end
end
