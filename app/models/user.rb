class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :last_name, length: { maximum: 255 }
  validates :password, length: { minimum: 3 } # , if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true # , if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
end
