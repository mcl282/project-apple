class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseInvitable::Inviter
  
  belongs_to :property
  belongs_to :maintenance_team
  
  has_and_belongs_to_many :tenants
  has_many :location_logs
  has_many :maintenance_requests
  has_many :invitations, :class_name => 'Tenant', :as => :invited_by
end
