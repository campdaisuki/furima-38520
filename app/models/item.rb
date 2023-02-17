class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :days_to_ship
  
  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :category_id, acceptance: { message: "can't be blank" }
  validates :shipping_charge_id, acceptance: { message: "can't be blank" }
  validates :condition_id,acceptance: { message: "can't be blank" }
  validates :prefecture_id, acceptance: { message: "can't be blank" }
  validates :days_to_ship_id, acceptance: { message: "can't be blank" }
  #validates :genre_id, numericality: { other_than: 1 } 
  
end