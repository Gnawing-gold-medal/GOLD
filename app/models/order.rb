class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :postal_code, {presence: true ,numericality: true, length: { is: 7 } }
  validates :address, {presence: true}
  validates :name, {presence: true}


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

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }

end