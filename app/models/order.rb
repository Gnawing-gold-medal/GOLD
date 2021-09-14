class Order < ApplicationRecord
  belongs_to :
  has_many :order_items, dependent: :destroy
end
