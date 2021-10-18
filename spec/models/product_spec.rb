require 'rails_helper'
require 'Product'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid Product' do
      @category = Category.create! name: "Shoes" 
      @product = Product.create!({name: "Crazy Shoes", price: 200, quantity: 5, category: @category})
      @product.save!

      expect(@product.id).to be_present
    end

    it 'should not be valid without a Product name' do
     
      @category = Category.create! name: "Shoes" 
      @product = Product.new({name: nil, price: 200, quantity: 5, category: @category})
      @product.valid?

      expect(@product.errors[:name]).to include("can't be blank")
      
    end

    it 'should not be valid without a Product price' do
     
      @category = Category.create! name: "Shoes" 
      @product = Product.new({name: "Fancy Shoes", price: nil, quantity: 5, category: @category})
      @product.valid?

      expect(@product.errors[:price]).to include("can't be blank")
      
    end

    it 'should not be valid without a Product quantity' do
     
      @category = Category.create! name: "Shoes" 
      @product = Product.new({name: "Fancy Shoes", price: 300, quantity: nil, category: @category})
      @product.valid?

      expect(@product.errors[:quantity]).to include("can't be blank")
      
    end
    
    it 'should not be valid without a category' do
     
      @product = Product.new({name: "Fancy Shoes", price: 300, quantity: 7, category: nil})
      @product.valid?

      expect(@product.errors[:category]).to include("can't be blank")
      
    end


  end
end
