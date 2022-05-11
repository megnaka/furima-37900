class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
    # @purchased_item = PurchasedItem.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :condition_id, :delivery_payer_id,
                                 :prefecture_id, :sending_days_id, :price).merge(user_id: current_user.id)
  end
end
