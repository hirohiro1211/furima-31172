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
    it 'カテゴリーの選択肢が「１」だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態の選択肢が「１」だと出品できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    it '配送料の負担の選択肢が「１」だと出品できない' do
      @item.delivery_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery burden must be other than 1")
    end
    it '発送元の地域の選択肢が「０」だと出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it '発送までの日数選択肢が「１」だと出品できない' do
      @item.delivery_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
    end
    it 'priceが300円未満では保存できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9999999以上では保存できない' do
      @item.price = 100000000
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
