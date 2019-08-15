class CreateDevelopments < ActiveRecord::Migration[5.2]
  def change
    create_table :developments do |t|
      t.string :application_number
      t.string :site_address
      t.text :proposal
      t.string :ward
      t.string :parish
      t.date :signed_on

      t.timestamps
    end
  end
end
