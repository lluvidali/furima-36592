class BuyInfo < ApplicationRecord
  belongs_to :order, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
