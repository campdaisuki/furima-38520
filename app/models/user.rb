class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :nickname, presence: true, length: {maximum: 40}
  validates :email, uniqueness: true
  validates :encrypted_password, presence: true, length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
