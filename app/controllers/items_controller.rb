class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :restrict_edit_access, only: [:edit]

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
    return unless user_signed_in?

    @is_owner = current_user == @item.user
    @can_purchase = !@is_owner && !@item.sold_out?
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def restrict_edit_access
    redirect_to root_path unless can_edit_item?
  end

  def can_edit_item?
    user_signed_in? && current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :bear_id, :area_id, :send_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end