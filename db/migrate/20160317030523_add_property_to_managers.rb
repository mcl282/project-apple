class AddPropertyToManagers < ActiveRecord::Migration
  def change
    add_reference :managers, :property, index: true, foreign_key: true
  end
end
