class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @destination_purchase = DestinationPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_purchase = DestinationPurchase.new(purchase_params)
    if @destination_purchase.valid?
      pay_item
      @destination_purchase.save
      redirect_to root_path 
    else
      render :index
    end
  end

  def purchase_params
    params.require(:destination_purchase).permit(:post_code, :prefecture_id, :municipality, :address, :building_name,
      :phone_number, :purchase_id,).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

end
