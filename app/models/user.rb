class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :staff_id, presence: true
  validates :staff_id, uniqueness: true
  enum role: { general: 0, admin: 1 }
  
  def ability
    @ability ||= Ability.new(self)
  end
  
  def admin_user?
    self.staff_id == "123456"
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
