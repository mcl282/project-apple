class RemoveWasherDryerInUnitFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :washer_dryer_in_unit    
  end
end
