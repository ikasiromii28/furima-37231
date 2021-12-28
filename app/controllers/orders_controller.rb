class OrdersController < ApplicationController
  before_action :find_item, only: [:index]

  def index
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end
end
