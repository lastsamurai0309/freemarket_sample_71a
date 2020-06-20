class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :last_name, :first_name, :last_name_fri, :first_name_fri, :birth_year, :birth_month, :birth_day, presence: true
  has_one :address
end
