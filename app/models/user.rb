class User < ApplicationRecord
  has_one :avatar, class_name: 'Image', as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :avatar
  validates_presence_of :avatar, :name
end
