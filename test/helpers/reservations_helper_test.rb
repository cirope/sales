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
end
