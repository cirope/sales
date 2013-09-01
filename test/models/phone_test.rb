require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  def setup
    @phone = phones :mobile
  end

  test 'validates blank attributes' do
    @phone.description = ''
    @phone.phone = ''
    
    assert @phone.invalid?
    assert_error @phone, :description, :blank
    assert_error @phone, :phone, :blank
  end

  test 'validates attributes length' do
    @phone.description = 'abcde' * 52
    @phone.phone = 'abcde' * 52
    
    assert @phone.invalid?
    assert_error @phone, :description, :too_long, count: 255
    assert_error @phone, :phone, :too_long, count: 255
  end
end
