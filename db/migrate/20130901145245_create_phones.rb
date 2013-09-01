class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :description, null: false
      t.string :phone, null: false
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
