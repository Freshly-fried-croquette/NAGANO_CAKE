class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
