require 'rails_helper'

RSpec.describe PerchaseShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @perchase_shipping_address = FactoryBot.build(:perchase_shipping_address)
    end

    it '電話番号が空だと購入できない' do
      @perchase_shipping_address.telephone_number = nil
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号はハイフン不要で11桁でないと購入できない' do
      @perchase_shipping_address.telephone_number = 123-234
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Telephone number is the wrong length (should be 11 characters)")
    end
    it '郵便番号が空だと購入できない' do
      @perchase_shipping_address.postal_code = nil
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が8文字じゃないと購入できない' do
      @perchase_shipping_address.postal_code = 1234567
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Postal code is the wrong length (should be 8 characters)")
    end

    it '配送先都道府県ががないと購入できない' do
      @perchase_shipping_address.prefecture_id = nil
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '配送先市区町村がないと購入できない' do
      @perchase_shipping_address.city = nil
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("City can't be blank")
    end
    it '配送先市番地がないと購入できない' do
      @perchase_shipping_address.address = nil
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Address can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @perchase_shipping_address.token = nil
      @perchase_shipping_address.valid?
      expect(@perchase_shipping_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end