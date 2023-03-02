class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :post_code,          null: false 
      t.integer :prefecture_id,     null: false
      t.string :municipality,       null: false
      t.string :address,            null: false
      t.string :building_name
      t.string :phone_number,       null: false
      t.integer :purchase_id
      t.timestamps
    end
  end
end
