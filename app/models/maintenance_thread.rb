class MaintenanceThread < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :maintenance_team
  default_scope -> {order(created_at: :desc)}
  
  has_many :maintenance_requests
  
  accepts_nested_attributes_for :maintenance_requests
  
  validates :maintenance_thread_title, presence: true
  
  validates_associated :maintenance_requests
end
