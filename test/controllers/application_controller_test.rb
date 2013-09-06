require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
    @controller.send 'response=', @response
    @controller.send 'request=', @request
  end

  test 'should current user be nil' do
    assert_nil current_user
  end

  test 'should load current user when auth_token is present' do
    login

    assert_not_nil current_user
  end

  test 'should redirect when there is no current user' do
    authorize

    assert_redirected_to login_url
  end

  test 'should not redirect when current user' do
    login
    authorize

    assert_nil @response.location
  end

  test 'should authorize admin' do
    login
    authorize_admin

    assert_nil @response.location
  end

  test 'should not authorize salesman' do
    login users(:john)
    authorize_admin

    assert_redirected_to login_url
  end

  private

  def current_user
    @controller.send(:current_user)
  end

  def authorize
    @controller.send(:authorize)
  end

  def authorize_admin
    @controller.send(:authorize_admin)
  end
end
