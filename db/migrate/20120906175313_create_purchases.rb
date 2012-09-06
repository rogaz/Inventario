class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.float :unit_price
      t.integer :product_id

      t.timestamps
    end
  end
end
