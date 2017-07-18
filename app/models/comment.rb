class Comment < ApplicationRecord
  belongs_to :class_session
  belongs_to :user  
end
