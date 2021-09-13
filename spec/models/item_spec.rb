require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    #bundle exec rspec spec/models/user_spec.rb@item.image = fixture_file_upload("public/images/test_image.png")
  end

  describe '商品出品機能' do
    context '商品出品情報が保存される場合' do
      it 'user_id,product,category_id,price,delivery_fee_id,content,status_id, prefecture_id, shipping_idとimageが存在していれば保存できる' do
        expect(@item).to be_valid
      end

    end
    context '商品出品情報が保存できない場合' do
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'category_idがないと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'priceがないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'delivery_fee_idがないと保存できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it 'contentがないと保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'status_idがないと保存できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'prefecture_idがないと保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_idがないと保存できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '¥300未満の数字だと保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '¥10,000,000以上の数字だと保存できない'do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end