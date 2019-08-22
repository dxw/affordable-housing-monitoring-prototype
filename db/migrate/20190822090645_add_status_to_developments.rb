class AddStatusToDevelopments < ActiveRecord::Migration[5.2]
  def change
    add_column :developments, :status, :string
  end
end
