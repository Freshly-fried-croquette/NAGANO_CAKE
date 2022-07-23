class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  
  def sale_status_color
    sale_status ? "font-weight-bold text-success":"font-weight-bold text-muted"
  end
  
end
