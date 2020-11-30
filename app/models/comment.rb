class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :body, length: { maximum: 65_535 }, presence: true
end
