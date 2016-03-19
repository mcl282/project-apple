class AddMaintenanceThreadToMaintenanceRequests < ActiveRecord::Migration
  def change
    add_reference :maintenance_requests, :maintenance_thread, index: true, foreign_key: true
  end
end
