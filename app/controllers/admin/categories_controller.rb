class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => 'Jungle', :password => 'book'

  def index
    @categories = Category.all
  end

  def show
  end

  def create
  end
end
