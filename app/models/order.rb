class Order < ApplicationRecord
  belongs_to :addresse
  has_many :order_items, dependent: :destroy
end
