class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :loan, null: false
      t.integer :loan_payments, null: false
      t.decimal :loan_amount, null: false
      t.decimal :advance, null: false
      t.string :address, null: false
      t.date :deliver_at, null: false
      t.references :commerce, null: false, index: true
      t.references :product, null: false, index: true
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
