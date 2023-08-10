class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
    return unless user_signed_in?
    @is_owner = current_user == @item.user
    @can_purchase = !@is_owner && !@item.sold_out?
  end

  def edit
    @item = Item.find(params[:id])
    if !user_signed_in? || current_user != @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :bear_id, :area_id, :send_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
