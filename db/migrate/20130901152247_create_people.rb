class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :identification, null: false
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
