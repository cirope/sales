class AddReservationToPhone < ActiveRecord::Migration
  def change
    add_reference :phones, :reservation, index: true, null: false
  end
end
