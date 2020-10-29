class Board < ApplicationRecord
  validates :title, length: { maximum: 255 }, presence: true
  validates :body, length: { maximum: 65_535 }, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
