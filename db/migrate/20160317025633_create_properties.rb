class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :property_address

      t.timestamps null: false
    end
  end
end
