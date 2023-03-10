class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, presence: { message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
  
end