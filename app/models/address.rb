class Address < ApplicationRecord
  belongs_to :customer

  validates :postal_code, {presence: true ,numericality: true, length: { is: 7 } }
  validates :address, {presence: true}
  validates :name, {presence: true}

  def full_address
    "〒" + self.postal_code + "\s" + self.address + "\s" + self.name
  end

end
