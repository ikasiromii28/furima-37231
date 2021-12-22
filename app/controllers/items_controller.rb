class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    #@items = Item.all
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
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id,
                                 :status_id, :shipping_id, :prefecture_id, :schedule_id, :price, :image)
          .merge(user_id: current_user.id)
  end
end
