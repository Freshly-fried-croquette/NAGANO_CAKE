class Customer::ShoppingCartsController < ApplicationController
  before_action :setup_cart_item!, only: %i[add_item update_item delete_item]

  # カート内アイテムの表示
  def index
    @cart_items = current_customer.shopping_carts.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  # アイテムの追加
  def create
    @cart_item = current_customer.shopping_carts.new(cart_item_params)
    @cart_items = current_customer.shopping_carts.all
    @cart_items.each do |cart_item|
      if cart_item.product_id == @cart_item.product.id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to customer_shopping_carts_path
  end

  def update
    @cart_item = ShoppingCart.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customer_shopping_carts_path
  end

  def destroy
    cart_item = ShoppingCart.find(params[:id])
    cart_item.destroy
    @cart_items = current_customer.shopping_carts.all
    redirect_to customer_shopping_carts_path
  end


  def all_destroy
    @cart_items = ShoppingCart.all
    @cart_items.destroy_all
    redirect_to customer_shopping_carts_path
  end
  def cart_item_params
    params.require(:shopping_cart).permit(:product_id, :customer_id, :quantity)
  end
end
