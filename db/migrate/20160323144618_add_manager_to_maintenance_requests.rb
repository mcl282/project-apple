class AddManagerToMaintenanceRequests < ActiveRecord::Migration
  def change
    add_reference :maintenance_requests, :manager, index: true, foreign_key: true
  end
end
