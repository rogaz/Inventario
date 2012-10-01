class RemoveQuantityUnitPriceFromPurchases < ActiveRecord::Migration
  def up
    remove_column :purchases, :quantity
    remove_column :purchases, :unit_price
    remove_column :purchases, :product_id
  end

  def down
    add_column :purchases, :product_id, :integer
    add_column :purchases, :unit_price, :decimal
    add_column :purchases, :quantity, :integer
  end
end
