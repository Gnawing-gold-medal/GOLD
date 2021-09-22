class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :counts, dependent: :destroy
  has_many :rates, dependent: :destroy
  attachment :image

  def taxin_price
    (price*1.08).round
  end

  def self.search(search)
    if search
      Item.where(['name LIKE ?', '%'+search+'%'])
    else
      Item.all
    end
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price, numericality: { only_integer: true, message: "は半角数字で入力してください" }
  end


end
