class AddThreadOpenToMaintenanceThreads < ActiveRecord::Migration
  def change
    add_column :maintenance_threads, :thread_open, :boolean
  end
end
