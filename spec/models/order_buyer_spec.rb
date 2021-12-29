require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品の購入' do
    context '商品を購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_buyer).to be_valid
     end
      it 'buildingは空でも保存できる' do
        @order_buyer.building = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '商品を購入できない時' do
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code の3桁目と4桁目の間にハイフンを入力してください (例： 123-4567)")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_buyer.prefecture_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「---」を選択していると保存できないこと' do
        @order_buyer.prefecture_id = '1'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order_buyer.addresses = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内の半角数字でないと保存できないこと' do
        @order_buyer.phone_number = '080-1234-5678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number は10桁以上、11桁以下で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空である' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
