class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_item, only: [:show, :edit, :update]

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
    # @purchased_item = PurchasedItem.new
  end

  def edit
  end

  def update
    @item = item
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :condition_id, :delivery_payer_id,
                                 :prefecture_id, :sending_days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
