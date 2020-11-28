class Board < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :title, length: { maximum: 255 }, presence: true
  validates :body, length: { maximum: 65_535 }, presence: true
end
