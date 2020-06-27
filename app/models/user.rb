class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birth_year, :birth_month, :birth_day, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_fri, :first_name_fri, presence: true, format: { with: /\A[ぁ-んー－]+\z/}
  has_one :address

  
end
