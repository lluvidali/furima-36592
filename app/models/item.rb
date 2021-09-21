class Item < ApplicationRecord
  validates :product,          presence: true
  validates :category_id,      presence: true
  validates :price,            presence: true,
                               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :delivery_fee_id,  presence: true
  validates :content,          presence: true
  validates :status_id,        presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_day_id,  presence: true
  validates :image,            presence: true

  validates :category_id, :delivery_fee_id, :status_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end
