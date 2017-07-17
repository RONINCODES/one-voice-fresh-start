class ClassSession < ApplicationRecord
  has_many :comments
  has_many :class_rooms
  has_many :surveys

end
