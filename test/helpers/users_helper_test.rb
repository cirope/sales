require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test 'user types' do
    assert_equal 2, user_types.size
  end
end
