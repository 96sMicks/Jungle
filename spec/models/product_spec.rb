require 'rails_helper'
require 'Product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should return a Product' do 
      @product = Product.new
      expect(@product).to be_a Product
    end

    it 'is not valid with in-valid name' do
      @product = Product.new(name: nil)
      expect(@product).to_not be_valid
    end

    
  end
end
