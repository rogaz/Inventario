class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :size
      t.integer :product_type_id

      t.timestamps
    end
  end
end
