class AddReservationToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :reservation, index: true, null: false
  end
end
