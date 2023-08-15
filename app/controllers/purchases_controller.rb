class PurchasesController < ApplicationController
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order_form).permit(:post_code , :area_id, :municipality, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_58bbe72fec6a62c883c28813"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end
end
