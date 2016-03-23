class AddNamesToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :first_name, :string
    add_column :tenants, :last_name, :string
  end
end
