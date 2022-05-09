class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end 

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new     
    end
  end

  private

  def items_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :condition_id, :delivery_payern_id, :prefecture_id, :sending_days_id, :price).merge(user_id: current_user.id)
  end
end
