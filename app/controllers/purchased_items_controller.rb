class PurchasedItemsController < ApplicationController

  def index    
    @item = Item.find(params[:item_id])
    @purchased_item_destination = PurchasedItemDestination.new
  end
  
  def create
    binding.pry
  end
end
