class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :property, index: true, foreign_key: true
      t.references :tenant, index: true, foreign_key: true
      t.references :manager, index: true, foreign_key: true
      t.float :total_rooms
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :square_feet_unit
      t.integer :floors
      t.boolean :central_air_conditioning
      t.boolean :dishwasher
      t.boolean :loft
      t.boolean :storage_available
      t.boolean :cable_and_internet
      t.boolean :microwave
      t.boolean :fireplace
      t.boolean :pre_furnished
      t.boolean :disability_access
      t.boolean :deck
      t.boolean :roof_deck
      t.boolean :terrace
      t.boolean :balcony

      t.timestamps null: false
    end
  end
end
