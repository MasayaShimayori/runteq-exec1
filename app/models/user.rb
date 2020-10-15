class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :first_name, length: { maximum: 255 }, presence: true
  validates :last_name, length: { maximum: 255 }, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
end
