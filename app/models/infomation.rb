class Infomation < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :telephone_number, {presence: true,numericality: true}
    validates :email
    validates :genre
    validates :content
  end

  enum status: { "未回答": 0, "回答済み": 1}, _prefix: true
  enum genre: { "ご注文・キャンセルについて": 0, "お支払い方法・お届けについて": 1, "サイトご利用について": 2, "その他ご要望": 3}, _prefix: true
end
