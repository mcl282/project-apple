class Photo < ActiveRecord::Base
  belongs_to :property
  belongs_to :unit
  
  mount_uploader :photo_file_name, PhotoUploader
  
  validate  :photo_size

  private

    # Validates the size of an uploaded picture.
    def photo_size
      if photo_file_name.size > 5.megabytes
        errors.add(:photo_file_name , "should be less than 5MB")
      end
    end
    

end

