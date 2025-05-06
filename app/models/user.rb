class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :login_id, presence: true, uniqueness: true
  validates :name, :kana_name, :email, presence: true
  
  # 管理者かどうかの判定（roleを使う）
  
end
