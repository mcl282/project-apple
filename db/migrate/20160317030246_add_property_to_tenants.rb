class AddPropertyToTenants < ActiveRecord::Migration
  def change
    add_reference :tenants, :property, index: true, foreign_key: true
  end
end
