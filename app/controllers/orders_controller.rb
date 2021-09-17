class OrdersController < ApplicationController

  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new
    if current_user == @item.user
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new(buy_info_params)
    if @order_info.valid?
      #pay_item
      @order_info.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_info_params
    params.require(:order_info).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end
  #def pay_item
    #Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    #Payjp::Charge.create(
      #amount: order_params[:price],  # 商品の値段
      #card: order_params[:token],    # カードトークン
      #currency: 'jpy'                 # 通貨の種類（日本円）
    #)
  #end

