class CreateDwellings < ActiveRecord::Migration[5.2]
  def change
    create_table :dwellings do |t|
      t.references :development, foreign_key: true
      t.string :tenure
      t.integer :habitable_rooms
      t.integer :bedrooms
      t.string :rsl

      t.timestamps
    end
  end
end
