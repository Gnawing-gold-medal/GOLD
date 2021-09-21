class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }
  def taxin_price
      (price * 1.08).round
  end
  
    
  def self.multi_update(order_item_params)
    order_item_params.to_h.map do |id, order_item_param|
      order_item = self.find(id)
      order_item.update_attributes!(order_item_param)
    end
  end
  

end
