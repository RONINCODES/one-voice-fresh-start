class ClassSession < ApplicationRecord

  belongs_to :class_room
  has_many :check_ins
  has_many :users, through: :check_ins
  has_many :comments
  has_many :surveys

  

end
