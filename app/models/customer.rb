class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def full_name
    self.last_name + self.first_name
  end
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } 
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } 
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } 
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } 
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } 
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } 
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } 
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } 
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } 

end
