require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:electronics)
  end

  test 'validates blank attributes' do
    @category.name = ''
    
    assert @category.invalid?
    assert_error @category, :name, :blank
  end

  test 'validates unique attributes' do
    @category = Category.new name: @category.name

    assert @category.invalid?
    assert_error @category, :name, :taken
  end

  test 'validates attributes length' do
    @category.name = 'abcde' * 52
    
    assert @category.invalid?
    assert_error @category, :name, :too_long, count: 255
  end
end
