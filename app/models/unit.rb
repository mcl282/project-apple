class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :tenant
  belongs_to :manager

  has_many :units

end
