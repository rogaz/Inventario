class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :sale_id

      t.timestamps
    end
  end
end
