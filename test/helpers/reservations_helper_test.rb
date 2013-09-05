require 'test_helper'

class ReservationsHelperTest < ActionView::TestCase
  setup do
    @reservation = Reservation.new
  end

  test 'reservation phones' do
    assert reservation_phones.all? { |p| p.kind_of? Phone }
  end

  test 'reservation people' do
    assert reservation_people.all? { |p| p.kind_of? Person }
  end

  test 'shallow reservation args' do
    @reservation = Reservation.new

    assert Array, shallow_reservation_args
    
    @reservation = reservations :computer_for_tomorrow

    assert_kind_of Reservation, shallow_reservation_args
  end
end
