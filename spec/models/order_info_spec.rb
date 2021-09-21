require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_info = FactoryBot.build(:order_info, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'postal_code,prefecture_id,city,address,tel,tokenがあれば保存ができること' do
      expect(@order_info).to be_valid
    end

    it 'buildingが空でも保存できること' do
      @order_info.building = nil
      expect(@order_info).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では保存ができないこと' do
      @order_info.postal_code = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'prefecture_idが空では保存ができないこと' do
      @order_info.prefecture_id = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では保存ができないこと' do
      @order_info.city = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では保存ができないこと' do
      @order_info.address = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Address can't be blank")
    end

    it 'telが空では保存ができないこと' do
      @order_info.tel = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Tel can't be blank")
    end

    it 'tokenが空では登録できないこと' do
      @order_info.token = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が3桁ハイフン4桁の半角文字列以外ではできないこと' do
      @order_info.postal_code = '１２３４５６７'
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '電話番号が10桁以上11桁以内の半角数値以外では登録できないこと' do
      @order_info.tel = '１２３４５６７'
      @order_info.valid?
      expect(@order_info.errors.full_messages).to include("Tel is invalid. Don't Include hyphen(-)")
    end
  end
end
