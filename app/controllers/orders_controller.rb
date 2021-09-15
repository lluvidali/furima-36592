class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).merge(user_id:, item_id:, current_user.id)
  end


end
