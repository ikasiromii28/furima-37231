class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contribute_confirmation, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id,
                                 :status_id, :shipping_id, :prefecture_id, :schedule_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contribute_confirmation
    redirect_to root_path if @item.user_id != current_user.id
  end
end
