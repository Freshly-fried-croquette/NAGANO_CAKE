class ChangeDeliveryAddresToDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_table :delivery_addres, :delivery_addresses
  end
end
