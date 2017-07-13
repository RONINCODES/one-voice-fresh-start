class User < ApplicationRecord
  has_many :class_rooms
  has_many :comments

end
