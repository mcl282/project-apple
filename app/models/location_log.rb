class LocationLog < ActiveRecord::Base
  belongs_to :manager
  belongs_to :tenant
end
