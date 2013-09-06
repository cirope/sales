require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin = users :franco
  end

  test 'kind of admin' do
    assert_kind_of Admin, @admin
  end
end
