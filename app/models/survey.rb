class Survey < ApplicationRecord
  belongs_to :class_session
  belongs_to :user 
end
