class AddBuiltInfoToDweliings < ActiveRecord::Migration[5.2]
  def change
    add_column :dwellings, :address, :string
    add_column :dwellings, :uprn, :string
    add_column :dwellings, :registered_provider, :string
  end
end
