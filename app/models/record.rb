class Record < ApplicationRecord
  belongs_to :resident
  validates :content, presence: true, unless: :image?
  validates :writer_name, presence: true

  mount_uploader :image, ImageUploader
  
end
