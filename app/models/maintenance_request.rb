class MaintenanceRequest < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :maintenance_team
end
