class AddTotalDateToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :total, :decimal
    add_column :purchases, :date, :date
  end
end
