class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :prevent_url, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @destination_purchase = DestinationPurchase.new
  end

  def create
    @destination_purchase = DestinationPurchase.new(purchase_params)
    if @destination_purchase.valid?
      pay_item
      @destination_purchase.save
      redirect_to root_path 
    else
      render :index
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
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

  def prevent_url
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user|| @item.purchase != nil
      redirect_to root_path
    end
  end

end
