class CreateCommerces < ActiveRecord::Migration
  def change
    create_table :commerces do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
