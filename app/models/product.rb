class Product < ApplicationRecord
  # attr_accessor :title, :description, :price, :image_filename
  validates :title, presence: true
  mount_uploader :image_filename, Image_filenameUploader
end
