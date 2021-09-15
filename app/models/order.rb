class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum payment_method: { card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmation: 1, producting: 2, ready: 3, complete: 4 }
end
