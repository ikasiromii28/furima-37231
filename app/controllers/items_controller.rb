class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id,
       :status_id, :shipping_id, :prefecture_id, :schedule_id, :price, :user, :image)
    end
end
