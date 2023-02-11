class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true, length: {maximum: 40}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,  format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]/ }
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
