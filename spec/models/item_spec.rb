require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できるとき' do
      it '入力必須項目が全て埋まっている' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが---だと登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空だと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idが---だと登録できない' do
        @item.status_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_idが空だと登録できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'shipping_idが---だと登録できない' do
        @item.shipping_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが---だと登録できない' do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduleが空だと登録できない' do
        @item.schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
      it 'scheduleが---だと登録できない' do
        @item.schedule_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが¥9,999,999以上だと登録できない' do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
