class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  with_options presence: true do
    validates :nickname, length: {maximum: 40}
    validates :family_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,  format: { with: VALID_PASSWORD_REGEX }

  has_many :purchases


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
