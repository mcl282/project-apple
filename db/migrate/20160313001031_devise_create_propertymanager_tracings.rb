class DeviseCreatePropertyManagerTracings < ActiveRecord::Migration
  def self.up
    create_table :property_manager_tracings do |t|
      t.integer  :property_manager_id
  t.datetime :sign_in_at
  t.datetime :sign_out_at
  #Any additional fields here
  #t.timestamps
end

add_index :property_manager_tracings, :property_manager_id
end

def self.down
drop_table :property_manager_tracings
end
end
