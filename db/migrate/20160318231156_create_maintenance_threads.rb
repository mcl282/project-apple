class CreateMaintenanceThreads < ActiveRecord::Migration
  def change
    create_table :maintenance_threads do |t|
      t.references :tenant, index: true, foreign_key: true
      t.references :maintenance_team, index: true, foreign_key: true
      t.string :maintenance_thread_title

      t.timestamps null: false
    end
  end
end
