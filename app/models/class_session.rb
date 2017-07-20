class ClassSession < ApplicationRecord
  #has many :surveys
  has_many :comments
  has_many :class_rooms
  has_many :surveys
  has_many :check_ins

end
