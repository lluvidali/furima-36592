class BuyInfo < ApplicationRecord

  validates :postal_code, presence: true
  validates :address,     presence: true
  validates :tel,         presence: true

  validates :prefecture_id { other_than: 1, message: "can't be blank" }

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end


