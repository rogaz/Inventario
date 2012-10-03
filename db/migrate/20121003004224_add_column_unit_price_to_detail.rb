class AddColumnUnitPriceToDetail < ActiveRecord::Migration
  def change
    add_column :details, :unit_price, :decimal
  end
end
