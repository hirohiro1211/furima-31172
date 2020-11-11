class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :introduce, :category_id, :state_id, :delivery_burden_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
