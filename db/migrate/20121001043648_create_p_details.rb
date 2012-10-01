class CreatePDetails < ActiveRecord::Migration
  def change
    create_table :p_details do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.integer :product_id
      t.integer :purchase_id

      t.timestamps
    end
  end
end
