class Property < ActiveRecord::Base
  
  has_many :managers
  has_many :tenants

end
