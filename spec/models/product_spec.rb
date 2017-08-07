require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do

    it 'should pass' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.new({
        name: 'skates',
        price: 9.99,
        quantity: 10,
        })
      @product.save!

      expect(@product).to be_present
    end

    it 'should have a name' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.new({
        name: nil,
        price: 9.99,
        quantity: 10,
        })
      expect(@product.name). to be_present
    end

    it 'should have a price' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.new({
        name: 'skates',
        price: nil,
        quantity: 10,
        })
      expect(@product.price). to be_present
    end

    it 'should have a quantity' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = @cat.products.new({
        name: 'skates',
        price: 9.99,
        quantity: nil,
        })
      expect(@product.quantity). to be_present
    end

    it 'should have a category' do
      @product = Product.new({
        name: 'skates',
        price: nil,
        quantity: 10,
        })
      expect(@product.category). to be_present
    end
  end
end
