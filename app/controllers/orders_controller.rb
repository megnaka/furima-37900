class OrdersController < ApplicationController

  def index
    @orders = Order.new
  end

  def create
    binding.pry
  end

end
