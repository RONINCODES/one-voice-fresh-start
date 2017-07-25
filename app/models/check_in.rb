class CheckIn < ApplicationRecord

  belongs_to :user
  belongs_to :class_session
  validates :user_id, uniqueness: true  

  def self.check_in(user, class_session)
    check_in = user.check_ins.new
    check_in.class_session_id = class_session.id
    check_in.save
  end

end
