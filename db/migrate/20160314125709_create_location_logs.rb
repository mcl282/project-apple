class CreateLocationLogs < ActiveRecord::Migration
  def change
    create_table :location_logs do |t|
      t.references :manager, index: true, foreign_key: true
      t.references :tenant, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
