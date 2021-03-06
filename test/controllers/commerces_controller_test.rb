require 'test_helper'

class CommercesControllerTest < ActionController::TestCase

  setup do
    @commerce = commerces(:macys)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:commerces)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create commerce' do
    assert_difference 'Commerce.count' do
      post :create, commerce: {
        name: 'New commerce',
        address: @commerce.address,
        city: @commerce.city,
        state: @commerce.state
      }
    end

    assert_redirected_to commerce_url(assigns(:commerce))
  end

  test 'should show commerce' do
    get :show, id: @commerce
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @commerce
    assert_response :success
  end

  test 'should update commerce' do
    patch :update, id: @commerce, commerce: { name: 'New name' }
    assert_redirected_to commerce_url(assigns(:commerce))
  end

  test 'should destroy commerce' do
    assert_difference 'Commerce.count', -1 do
      delete :destroy, id: @commerce
    end

    assert_redirected_to commerces_path
  end
end
