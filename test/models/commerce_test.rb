require 'test_helper'

class CommerceTest < ActiveSupport::TestCase
  def setup
    @commerce = commerces(:macys)
  end

  test 'validates blank attributes' do
    @commerce.name = ''
    @commerce.address = ''
    @commerce.city = ''
    @commerce.state = ''
    
    assert @commerce.invalid?
    assert_error @commerce, :name, :blank
    assert_error @commerce, :address, :blank
    assert_error @commerce, :city, :blank
    assert_error @commerce, :state, :blank
  end

  test 'validates unique attributes' do
    @commerce = Commerce.new name: @commerce.name

    assert @commerce.invalid?
    assert_error @commerce, :name, :taken
  end

  test 'validates attributes length' do
    @commerce.name = 'abcde' * 52
    @commerce.address = 'abcde' * 52
    @commerce.city = 'abcde' * 52
    @commerce.state = 'abcde' * 52
    
    assert @commerce.invalid?
    assert_error @commerce, :name, :too_long, count: 255
    assert_error @commerce, :address, :too_long, count: 255
    assert_error @commerce, :city, :too_long, count: 255
    assert_error @commerce, :state, :too_long, count: 255
  end
end
