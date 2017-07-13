class ClassSession < ApplicationRecord
  #has many :surveys 
  has_many :comments
  has_many :class_rooms
end
