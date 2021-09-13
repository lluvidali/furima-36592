require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品情報が保存される場合' do
      it 'user_id,product,category_id,price,delivery_fee_id,content,status_id, prefecture_id, shipping_idとimageが存在していれば保存できる' do

      end

    end
    context '商品出品情報が保存できない場合' do
      it 'user_id,product,category_id,price,delivery_fee_id,content,status_id, prefecture_id, shipping_idとimageが存在していないと保存できない' do

      end
      it 'userが紐付いていないと保存できない' do
      end

      it 'category_idがないと保存できない'
      end

      it 'priceがないと保存できない'
      end

      it 'delivery_fee_idがないと保存できない'
      end

      it 'contentがないと保存できない'
      end

      it 'status_idがないと保存できない'
      end

      it 'prefecture_idがないと保存できない'
      end

      it 'shipping_idがないと保存できない'
      end

      it 'imageがないと保存できない'
      end
      

    end
  end
end