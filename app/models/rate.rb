class Rate < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  attachment :image
end
