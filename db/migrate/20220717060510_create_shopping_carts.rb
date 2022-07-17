class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      
      t.integer :customer_id, null: false
      t.integer :product_id,  null: false
      t.integer :quantity,    null: false

      t.timestamps
    end
  end
end
