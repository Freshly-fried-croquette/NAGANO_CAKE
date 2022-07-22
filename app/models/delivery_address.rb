class DeliveryAddress < ApplicationRecord
 belongs_to :customer

  validates :customer_id, :name, :address, :postal_code, presence: true
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
