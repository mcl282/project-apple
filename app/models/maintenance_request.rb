class MaintenanceRequest < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :property
  belongs_to :maintenance_team
  

end
