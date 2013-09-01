require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people :franco
  end

  test 'validates blank attributes' do
    @person.identification = ''
    @person.name = ''
    
    assert @person.invalid?
    assert_error @person, :identification, :blank
    assert_error @person, :name, :blank
  end

  test 'validates attributes length' do
    @person.identification = 'abcde' * 52
    @person.name = 'abcde' * 52
    
    assert @person.invalid?
    assert_error @person, :identification, :too_long, count: 255
    assert_error @person, :name, :too_long, count: 255
  end
end
