class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  has_attached_file :image,
    storage: :google_drive,
    google_drive_credentials: "#{Rails.root}/config/google_drive.yml",
    styles: { medium: "300x300", thumb: '100x100' },
    google_drive_options: {
      public_folder_id: '0B_O5YQUKw2SiOGFDMXo4VWo3OU0'
    }
  validates_attachment :image, content_type: {
    content_type: [
      "image/jpg",
      "image/jpeg",
      "image/png",
      "image/gif"]
    }

  def url(*args)
    image.url(*args)
  end
end
