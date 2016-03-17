class Property < ActiveRecord::Base
  
  has_many :managers
  has_many :tenants
  has_many :maintenance_requests
  
  has_one :maintenance_team

end
