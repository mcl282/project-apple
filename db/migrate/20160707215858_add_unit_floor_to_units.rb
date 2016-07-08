class AddUnitFloorToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_floor, :Integer
  end
end
