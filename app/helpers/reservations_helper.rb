module ReservationsHelper
  def reservation_phones
    [
      t('reservations.form.phones.home'),
      t('reservations.form.phones.mobile'),
      t('reservations.form.phones.delivery')
    ].map { |type| reservation_phone type }
  end

  def reservation_people
    @reservation.people.build until @reservation.people.size == 2

    @reservation.people
  end

  private

  def reservation_phone type
    phone = @reservation.phones.detect { |p| p.description == type }

    phone || @reservation.phones.new(description: type)
  end
end
