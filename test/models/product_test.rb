require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:computer)
  end

  test 'validates blank attributes' do
    @product.name = ''
    @product.price = nil
    @product.stock = nil
    @product.category = nil
    
    assert @product.invalid?
    assert_error @product, :name, :blank
    assert_error @product, :price, :blank
    assert_error @product, :stock, :blank
    assert_error @product, :category, :blank
  end

  test 'validates unique attributes' do
    @product = Product.new category_id: @product.category_id, name: @product.name

    assert @product.invalid?
    assert_error @product, :name, :taken
  end

  test 'validate numeric attributes' do
    @product.price = 0
    @product.stock = -1

    assert @product.invalid?
    assert_error @product, :price, :greater_than, count: 0
    assert_error @product, :stock, :greater_than_or_equal_to, count: 0
  end

  test 'validates attributes length' do
    @product.name = 'abcde' * 52
    
    assert @product.invalid?
    assert_error @product, :name, :too_long, count: 255
  end
end
