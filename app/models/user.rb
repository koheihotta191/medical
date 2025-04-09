class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :staff_id, presence: true
  validates :staff_id, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
