require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def setup
    @reservation = reservations :computer_for_tomorrow
  end

  test 'validates blank attributes' do
    @reservation.loan = ''
    @reservation.address = ''
    @reservation.loan_payments = nil
    @reservation.loan_amount = nil
    @reservation.advance = nil
    @reservation.deliver_at = nil
    @reservation.commerce_id = nil
    @reservation.product_id = nil
    
    assert @reservation.invalid?
    assert_error @reservation, :loan, :blank
    assert_error @reservation, :address, :blank
    assert_error @reservation, :loan_payments, :blank
    assert_error @reservation, :loan_amount, :blank
    assert_error @reservation, :advance, :blank
    assert_error @reservation, :deliver_at, :blank
    assert_error @reservation, :commerce_id, :blank
    assert_error @reservation, :product_id, :blank
  end

  test 'validates attributes length' do
    @reservation.loan = 'abcde' * 52
    @reservation.address = 'abcde' * 52
    
    assert @reservation.invalid?
    assert_error @reservation, :loan, :too_long, count: 255
    assert_error @reservation, :address, :too_long, count: 255
  end

  test 'validates attributes numericality' do
    @reservation.loan_payments = -1
    @reservation.loan_amount = -1

    assert @reservation.invalid?
    assert_error @reservation, :loan_payments, :greater_than, count: 0
    assert_error @reservation, :loan_amount, :greater_than, count: 0

    @reservation.loan_payments = 1000
    assert @reservation.invalid?
    assert_error @reservation, :loan_payments, :less_than, count: 120
  end

  test 'validates dates' do
    @reservation.deliver_at = '13/13/13'

    assert @reservation.invalid?
    assert_error @reservation, :deliver_at, :invalid_date
  end
end
