require 'rails_helper'

RSpec.describe Perchase, type: :model do
  describe '商品購入' do
    before do
      @perchase_shipping_addres = FactoryBot.build(:perchase_shipping_addres)
    end

end
