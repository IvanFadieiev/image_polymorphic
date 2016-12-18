class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  has_attached_file :image,
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    styles: { medium: "300x300>", thumb: "100x100>" },
    # path: ":id/:style_:filename"
    :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"}, :unique_filename => true
    }
    validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def url(*args)
    image.url(*args)
  end
end
