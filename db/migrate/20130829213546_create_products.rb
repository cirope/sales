class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 15, scale: 2, null: false
      t.integer :stock, null: false, default: 0
      t.integer :lock_version, default: 0, null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
