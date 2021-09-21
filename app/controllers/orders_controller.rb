class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new
    if @item.order != nil 
    redirect_to root_path 
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new(buy_info_params)
    if @order_info.valid?
      pay_item
      @order_info.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_info_params
    params.require(:order_info).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_info_params[:token],
      currency: 'jpy'
    )
  end
end
