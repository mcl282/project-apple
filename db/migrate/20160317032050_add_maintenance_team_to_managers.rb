class AddMaintenanceTeamToManagers < ActiveRecord::Migration
  def change
    add_reference :managers, :maintenance_team, index: true, foreign_key: true
  end
end
