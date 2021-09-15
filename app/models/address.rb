class Address < ApplicationRecord
  belongs_to :customer
  enum payment_method: { card: 0, transfer: 1 }
  enum address: { myself: 0, register: 1, new:  }
end
