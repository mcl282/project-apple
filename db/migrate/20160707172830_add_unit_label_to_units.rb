class AddUnitLabelToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_label, :string
  end
end
