class Comment < ApplicationRecord
  belongs_to :class_session
  belongs to :user  
end
