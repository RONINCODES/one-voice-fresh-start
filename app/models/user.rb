class User < ApplicationRecord

  has_secure_password

  has_many :class_rooms
  has_many :check_ins
  has_many :class_sessions, through: :check_ins
  has_many :comments
  has_many :surveys

  validates :first_name, :last_name, :email, :role, :password, :password_confirmation, presence: true

   mount_uploader :user_image, UserImageUploader

end
