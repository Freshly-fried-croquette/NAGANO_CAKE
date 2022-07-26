class Product < ApplicationRecord
  has_one_attached :image
  has_many :shopping_carts, dependent: :destroy
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  def sale_status_color
    sale_status ? "font-weight-bold text-success":"font-weight-bold text-muted"
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def sum_of_price
    product.with_tax_price * quantity
  end
end
