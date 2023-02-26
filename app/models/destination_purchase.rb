class DestinationPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name,
    :phone_number, :purchase_id, :item_id, :user_id


  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
  end
end