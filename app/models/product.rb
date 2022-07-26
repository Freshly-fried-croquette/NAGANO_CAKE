class Product < ApplicationRecord
  has_one_attached :image
  has_many :shopping_carts
  belongs_to :genre
  belongs_to :order
  has_many :order_detail

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
end
