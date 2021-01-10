class User < ApplicationRecord
  mount_uploader :avatar_image, AvatarImageUploader
  authenticates_with_sorcery!

  validates :first_name, length: { maximum: 255 }, presence: true
  validates :last_name, length: { maximum: 255 }, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board

  def own?(object)
    id == object.user_id
  end

  def bookmark(board)
    bookmark_boards << board
  end

  def unbookmark(board)
    bookmarks.find_by(board_id: board.id).destroy
  end

  def bookmark?(board)
    bookmark_boards.include?(board)
  end
end
