class Item < ApplicationRecord
  validates :product,          presence: true
  validates :category_id,      presence: true
  validates :price,            presence: true
  validates :delivery_fee_id,  presence: true
  validates :content,          presence: true
  validates :status_id,        presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_days_id, presence: true

  validates :category_id, :delivery_fee_id, :status_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_days


end
