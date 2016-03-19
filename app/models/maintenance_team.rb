class MaintenanceTeam < ActiveRecord::Base
  belongs_to :property
  
  has_many :managers
  has_many :maintenance_threads

end
