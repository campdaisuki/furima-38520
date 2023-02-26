class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @destination_purchase = DestinationPurchase.new
  end

  def create
    @destination_purchase = DestinationPurchase.new(purchase_params)
    if @destination_purchase.valid?
      @destination_purchase.save
      redirect_to root_path 
    else
      render :index
    end
  end

  def purchase_params
    params.require(:destination_purchase).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
