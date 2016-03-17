class CreateMaintenanceRequests < ActiveRecord::Migration
  def change
    create_table :maintenance_requests do |t|
      t.references :tenant, index: true, foreign_key: true
      t.references :maintenance_team, index: true, foreign_key: true
      t.text :request_message
      t.boolean :request_open

      t.timestamps null: false
    end
  end
end
