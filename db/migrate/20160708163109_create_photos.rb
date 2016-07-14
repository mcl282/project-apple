class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_file_name
      t.references :property, index: true, foreign_key: true
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
