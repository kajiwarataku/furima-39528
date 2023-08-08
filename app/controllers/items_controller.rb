class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :bear_id, :area_id, :send_day_id)
  end

end