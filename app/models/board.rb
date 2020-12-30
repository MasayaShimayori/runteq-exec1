class Board < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :bookmarks
  has_many :comments, dependent: :destroy

  validates :title, length: { maximum: 255 }, presence: true
  validates :body, length: { maximum: 65_535 }, presence: true

  def search_bookmark(user)
    self.bookmarks.find_by(user: user)
  end
end
