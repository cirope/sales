require 'test_helper'

class SalesmanTest < ActiveSupport::TestCase
  def setup
    @salesman = users :john
  end

  test 'kind of salesman' do
    assert_kind_of Salesman, @salesman
  end
end
