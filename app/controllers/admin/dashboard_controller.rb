class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => 'Jungle', :password => 'book'

  def show
    @products_total = Product.count
    @category_total = Category.count
  end
end
