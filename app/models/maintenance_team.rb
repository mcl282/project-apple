class MaintenanceTeam < ActiveRecord::Base
  belongs_to :property
  
  has_many :managers

end
