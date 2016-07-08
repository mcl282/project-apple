class AddWasherDryerInUnitToUnits < ActiveRecord::Migration
  def change
    add_column :units, :washer_dryer_in_unit, :boolean
  end
end
