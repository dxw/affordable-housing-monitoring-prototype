class CreateAuditLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :audit_logs do |t|
      t.references :development
      t.references :dwelling
      t.string :created_by
      t.string :what_changed
      t.text :comment

      t.timestamps
    end
  end
end
