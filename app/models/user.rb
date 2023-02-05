class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true, length: {maximum: 40}
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: {minimum: 6}
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
