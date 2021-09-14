class Order < ApplicationRecord
  belongs_to :customers
  has_many :order_items, dependent: :destroy
end
