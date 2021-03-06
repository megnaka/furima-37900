class PurchasedItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_index]
  before_action :move_to_index

  def index
    @purchased_item_destination = PurchasedItemDestination.new
  end

  def create
    @purchased_item_destination = PurchasedItemDestination.new(purchased_item_params)
    if @purchased_item_destination.valid?
      pay_item
      @purchased_item_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_index
    redirect_to root_path unless current_user.id != @item.user_id && @item.purchased_item.blank?
  end

  def purchased_item_params
    params.require(:purchased_item_destination).permit(:postal_code, :prefecture_id, :city, :building_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id])[:price],
      card: purchased_item_params[:token],
      currency: 'jpy'
    )
  end
end
