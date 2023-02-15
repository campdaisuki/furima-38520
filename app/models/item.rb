class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :name, :text, :price, :category_id, :shipping_charge_id,:condition_id, :prefecture_id, :days_to_ship_id, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  
end