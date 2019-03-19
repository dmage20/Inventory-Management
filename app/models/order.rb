class Order < ApplicationRecord
  belongs_to :user
  has_one :customer
  has_many :order_products
  has_many :products, through: :order_products
end
