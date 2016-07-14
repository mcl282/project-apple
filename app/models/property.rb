class Property < ActiveRecord::Base
  
  has_many :managers
  has_many :tenants
  has_many :maintenance_requests
  has_many :units
  has_many :photos
  
  has_one :maintenance_team

  accepts_nested_attributes_for :photos

  validates :property_name, :property_address, :year_built, presence: true
  validates :year_built, numericality: { only_integer: true }
  validates_length_of :year_built, :is => 4
  
  
end
