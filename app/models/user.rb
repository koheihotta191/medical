class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :staff_id, presence: true
  validates :staff_id, uniqueness: true
  enum role: { general: 0, admin: 1 }
  
  # 管理者かどうかの判定（roleを使う）
  
end
