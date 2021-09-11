class ItemsController < ApplicationController
  def index
  end

  private

  def image_params
    params.require(:items).permit(:product, :category_id, :price, :delivery_fee_id, :content, :status_id, :prefecture_id, :shipping_days_id, :image).merge(user_id: current_user_id)
end
