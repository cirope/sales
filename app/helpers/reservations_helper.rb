module ReservationsHelper
  def reservation_phones
    [
      t('reservations.form.phones.home'),
      t('reservations.form.phones.mobile'),
      t('reservations.form.phones.delivery')
    ].map { |type| reservation_phone type }
  end

  def reservation_people
    if @reservation.new_record?
      @reservation.people.build while @reservation.people.size < 2
    end

    @reservation.people
  end

  def shallow_reservation_args
    @reservation.new_record? ? [@product, @reservation] : @reservation
  end

  private

  def reservation_phone type
    phone = @reservation.phones.detect { |p| p.description == type }

    phone || @reservation.phones.new(description: type)
  end
end
