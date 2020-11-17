class PerchasesController < ApplicationController
  before_action :set_item

  def index
   @perchase_shipping_address = PerchaseShippingAddress.new
   if user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
   end
  end

  def create
    @perchase_shipping_address = PerchaseShippingAddress.new(perchase_params)
    if @perchase_shipping_address.valid?
      pay_item
      @perchase_shipping_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
  def perchase_params
    params.require(:perchase_shipping_address).permit(:telephone_number, :postal_code, :prefecture_id, :city, :address, :building_name, :perchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: perchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
