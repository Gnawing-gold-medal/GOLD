class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sum_of_price
    item.taxin_price * amount
  end

  def taxin_price
    (price*1.08).round
  end

end
