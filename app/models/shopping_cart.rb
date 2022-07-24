class ShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  def with_tax_price
      (price * 1.1).floor
  end

  def sum_of_price
    product.with_tax_price * quantity
  end

end
