require 'test_helper'

class AuthorizationHelperTest < ActionView::TestCase
  test 'salesman' do
    def current_user; users(:john); end

    assert salesman?
  end
end
