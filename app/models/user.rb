class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true, length: {maximum: 40}
  validates :email, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,  length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
