class Address < ApplicationRecord
  belongs_to :customer

  def full_address
    "〒" + self.postal_code + "\s" + self.address + "\s" + self.name
  end

end
