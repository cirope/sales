require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase

  setup do
    @reservation = reservations :computer_for_tomorrow

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create reservation' do
    assert_difference 'Reservation.count' do
      post :create, reservation: {
        commerce_id: @reservation.commerce_id,
        loan: @reservation.loan,
        loan_payments: @reservation.loan_payments,
        loan_amount: @reservation.loan_amount,
        advance: @reservation.advance,
        product_id: @reservation.product_id,
        address: @reservation.address,
        deliver_at: I18n.l(@reservation.deliver_at)
      }
    end

    assert_redirected_to reservation_url(assigns(:reservation))
  end

  test 'should show reservation' do
    get :show, id: @reservation
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @reservation
    assert_response :success
  end

  test 'should update reservation' do
    patch :update, id: @reservation, reservation: { address: 'New address' }
    assert_redirected_to reservation_url(assigns(:reservation))
  end

  test 'should destroy reservation' do
    assert_difference 'Reservation.count', -1 do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
