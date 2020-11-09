require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'intoroduceが空だと出品できない' do
      @item.introduce = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduce can't be blank")
    end
    it 'カテゴリー必須' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it '商品の状態についての情報が必須' do
      @item.state = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it '配送料の負担についての情報が必須' do
      @item.delivery_burden = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery burden is not a number")
    end
    it '発送元の地域についての情報が必須' do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it '発送までの日数についての情報が必須' do
      @item.delivery_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date is not a number")
    end
    it 'priceが300円未満では保存できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9999999以上では保存できない' do
      @item.price = '100000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceが半角英数字のみ保存可能' do
      @item.price = '３３３３'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
