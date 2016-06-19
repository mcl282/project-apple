class AddColumnsToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :building_class, :string
    add_column :properties, :year_built, :integer
    add_column :properties, :floor_count_building, :integer
    add_column :properties, :unit_count_building, :integer
    add_column :properties, :square_footage_building_total, :integer
    add_column :properties, :description, :text
    add_column :properties, :cats_and_dogs_allowed, :boolean
    add_column :properties, :elevator_building, :boolean
    add_column :properties, :full_time_doorman, :boolean
    add_column :properties, :concierge, :boolean
    add_column :properties, :washer_dryer_in_unit, :boolean
    add_column :properties, :laundry_in_building, :boolean
    add_column :properties, :fitness_center, :boolean
    add_column :properties, :swimming_pool, :boolean
    add_column :properties, :parking_available, :boolean
    add_column :properties, :common_area, :boolean
    add_column :properties, :courtyard_building, :boolean
    add_column :properties, :live_in_super, :boolean
    add_column :properties, :storage_available, :boolean
    add_column :properties, :bikeroom_in_building, :boolean
    add_column :properties, :outdoor_space, :boolean
    add_column :properties, :deck_building, :boolean
    add_column :properties, :roof_deck_building, :boolean
    add_column :properties, :terrace_building, :boolean
    add_reference :properties, :manager, index: true, foreign_key: true
  end
end
