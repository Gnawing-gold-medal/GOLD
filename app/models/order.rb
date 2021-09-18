class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  def self.search(method)
    if method == '入金待ち'
      Order.where(status: 0)
    elsif method == "入金確認"
      Order.where(status: 1)
    elsif method == '製作中'
      Order.where(status: 2)
    elsif method == '発送準備中'
      Order.where(status: 3)  
    elsif method == '発送済み'
      Order.where(status: 4)
    else
      Order.all
    end

  end
end
