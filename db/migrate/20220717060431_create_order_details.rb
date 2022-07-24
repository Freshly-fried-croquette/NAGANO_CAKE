class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id,    null: false
      t.integer :product_id,  null: false
      t.integer :price,       null: false
      t.integer :quantity,    null: false
      t.integer :make_status, default: 0, null: false
      
   def change
    create_table :order_details do |t|
      t.integer :status,default: 0, null: false, limit: 1
      t.timestamps
    end
   end

      t.timestamps
    end
  end
end
