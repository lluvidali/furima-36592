class OrderInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address, :city, :building, :tel, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :address,     presence: true
  validates :city,        presence: true
  validates :tel,         presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Don't Include hyphen(-)" }
  validates :token,       presence: true
  validates :user_id,     presence: true
  validates :item_id,     presence: true

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    BuyInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   tel: tel, order_id: order.id)
  end
end
