class AddDisabilityAccessibleToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :disability_accessible, :boolean
  end
end
