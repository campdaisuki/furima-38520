require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  describe '商品購入記録の保存' do
    before do
       @user = FactoryBot.create(:user)
       @item = FactoryBot.create(:item)
       @destination_purchase = FactoryBot.build(:destination_purchase,user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@destination_purchase).to be_valid
      end
      it '建物名が空でも購入できること' do
        @destination_purchase.building_name = ''
        expect(@destination_purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @destination_purchase.post_code = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Post code can't be blank"
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @destination_purchase.post_code = '123-123４'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Post code is invalid"
      end
      it '都道府県未選択の場合は購入できないこと' do
        @destination_purchase.prefecture_id = 1
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '市区町村が空だと購入できないこと' do
        @destination_purchase.municipality = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地が空だと購入できないこと' do
        @destination_purchase.address = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空だと購入できないこと' do
        @destination_purchase.phone_number = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @destination_purchase.phone_number = '090123456'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が12桁以上だと購入できない' do
        @destination_purchase.phone_number = '090123456789'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @destination_purchase.phone_number = '０9012341234'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Phone number is invalid"
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @destination_purchase.user_id = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @destination_purchase.item_id = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
