class ClassRoom < ApplicationRecord
  has_many :class_sessions
  has_and_belongs_to_many :users
end
