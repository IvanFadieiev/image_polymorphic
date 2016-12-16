class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  has_attached_file :image,
                     styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def url(*args)
    image.url(*args)
  end
end
