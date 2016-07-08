class AddUnitDescriptionToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_description, :text
  end
end
