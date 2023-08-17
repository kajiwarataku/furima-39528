class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :restrict_edit_access, only: [:edit, :destroy]

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
  
    @purchase = @item.purchase
  
    @is_owner = current_user == @item.user
    @can_edit = @is_owner && @purchase.nil?
    @can_purchase = !@is_owner && @purchase.nil?
  end
  

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.purchase&.address&.destroy
      @item.purchase&.destroy
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def restrict_edit_access
    @item = Item.find(params[:id])
    redirect_to root_path if !can_edit_item? || @item.sold_out?
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