class MaintenanceRequest < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :property
  belongs_to :maintenance_team
  default_scope -> {order(created_at: :desc)}

end
