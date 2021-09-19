class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  attachment :image
end
