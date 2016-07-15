class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invite_for => 2.weeks
  
  belongs_to :property
  
  has_and_belongs_to_many :managers
  has_many :maintenance_requests
  has_many :maintenance_threads
  
  
end
