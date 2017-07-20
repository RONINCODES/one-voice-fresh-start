class User < ApplicationRecord

  has_secure_password

  has_many :class_rooms
  has_many :comments
  has_many :surveys
  has_many :check_ins

  validates :first_name, :last_name, :email, :role, :password, :password_confirmation, presence: true

end
