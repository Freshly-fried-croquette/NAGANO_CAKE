class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_addresses, dependent: :destroy
  has_many :shopping_carts
  has_many :orders



  validates :last_name, presence:true
  validates :first_name, presence:true
  validates :last_name_kana, presence:true
  validates :first_name_kana, presence:true
  validates :post_code, presence:true
  validates :address, presence:true
  validates :phone_number, presence:true

  def is_active_color
    is_active ? "font-weight-bold text-success":"font-weight-bold text-muted"
  end

end
