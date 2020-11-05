class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def new
   @item = Item.new
  end

  def create
   Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :introduce, :category_id, :state_id, :delivery_burden_id, :prefecture_id, :delivery_dates_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
