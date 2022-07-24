class Product < ApplicationRecord
  has_one_attached :image
  has_many :shopping_carts
  belongs_to :genre

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def with_tax_price
      (price * 1.1).floor
  end
end
